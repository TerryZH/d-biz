class Order < ActiveRecord::Base
  has_many :items

  def self.process_new_order(params)
      valid_order = false
      range = (0...(params[:new_order][:item_count].to_i))
      range.each { |i| valid_order ||= (params[:new_order][("number_sn_"+i.to_s).to_sym].to_f != 0) }
      
      if valid_order
          addr = params[:new_order][:neighbourhood] + "-" \
          + params[:new_order][:district] + "-" \
          + params[:new_order][:building] + "-" \
          + params[:new_order][:unit] + "-" \
          + params[:new_order][:floor] + "-" \
          + params[:new_order][:room]
          c = Customer.find_by_tel(params[:new_order][:tel]) ||
          Customer.create(:when_joined => Date.today,
                          :nick => "",
                          :tel => params[:new_order][:tel],
                          :email => "",
                          :wechat => "",
                          :weibo => "")
          a = Address.find_by_location(addr) ||
              Address.create(:region => "北京市--朝阳区-管庄乡",
                             :location => addr)
          o = Order.create(:when => Date.today,
                           :who_id => c.id,
                           :sum => 0)
          d = Delivery.create(:ship_to_id => a.id,
                              :who_id=>2,
                              :start=>Time.now)
          
          range.each do |i|
              n = params[:new_order][("number_sn_"+i.to_s).to_sym].to_f
              if n != 0
                  p = params[:new_order][("product_sn_"+i.to_s).to_sym].to_i
                  cooked = params[:new_order][("cooked_sn_"+i.to_s).to_sym]
                  discount = params[:new_order][("discount_sn_"+i.to_s).to_sym].to_f
                  price = Product.find_by_id(p).price
                  cost = Product.find_by_id(p).cost
                  if cooked == "1"
                    price += 0.1
                    cost += 0.02
                  end
                  if cooked == "2"
                    discount = price*n
                  end
                  Item.create(:order_id => o.id,
                              :delivery_id => d.id,
                              :product_id => p,
                              :number => n,
                              :price => price,
                              :cost => cost,
                              :discount => discount)
              end
          end
      end
  end
  
end
