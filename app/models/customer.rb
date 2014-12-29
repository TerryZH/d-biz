class Customer < ActiveRecord::Base

  def self.find_address_by_id(id)
    return find_address_by_condition({:id => id})
  end

  def self.find_preference_by_id(id)
    return find_preference_by_condition({:id => id})
  end

  def self.find_address_by_tel(tel)
    return find_address_by_condition({:tel => tel})
  end

  def self.find_preference_by_tel(tel)
    return find_preference_by_condition({:tel => tel})
  end

  def self.find_address_by_addr(location, region)
    customer = find_by_addr(location, region)
    if customer
        id = customer.id
    else
        id = nil
    end
    return find_address_by_condition({:id => id})
  end

  def self.find_preference_by_addr(location, region)
    customer = find_by_addr(location, region)
    if customer
        id = customer.id
    else
        id = nil
    end
    return find_preference_by_condition({:id => id})
  end

  def self.find_by_addr(location, region)
    location ||= ""
    region ||= ""
    return Customer.find_by_sql(["select distinct customers.* from items join deliveries on items.delivery_id=deliveries.id join addresses on deliveries.ship_to_id=addresses.id join orders on items.order_id=orders.id join customers on customers.id=orders.who_id where addresses.location like ? and addresses.region like ? order by orders.id DESC", "%"+location+"%", "%"+region+"%"]).first
  end

  def self.find_address_by_condition(cond)
    result = Array.new
    customers = Customer.where cond
    customers.each do |c|
      addresses = Address.find_by_sql ["select distinct addresses.* from items join deliveries on items.delivery_id=deliveries.id join orders on items.order_id=orders.id join addresses on deliveries.ship_to_id=addresses.id where orders.who_id=?", c.id]
      addresses.each do |a|
        result.insert -1, a
      end
    end
    return result
  end

  def self.find_preference_by_condition(cond)
    ph = Array.new
    pl = Array.new
    customers = Customer.where cond
    customers.each do |c|
      ph = merge_preferences(ph, find_preferences_historical_by_c_id(c.id))
      pl = merge_preferences(pl, find_preferences_last_order_by_c_id(c.id))
    end
    return { :historical => ph, :last_order => pl }
  end

  private
  def self.find_preferences_historical_by_c_id(c_id)
    return Item.find_by_sql ["select items.product_id as product_id, sum(items.number) as product_number from items join orders on items.order_id=orders.id where orders.who_id=? group by items.product_id", c_id]
  end

  private
  def self.find_preferences_last_order_by_c_id(c_id)
    return Item.find_by_sql ["select items.product_id as product_id, sum(items.number) as product_number from items where items.order_id=? group by items.product_id", Order.where(:who_id => c_id).order('id DESC').first.id]
  end

  private
  def self.merge_preferences(a,b)
    return b
  end
end
