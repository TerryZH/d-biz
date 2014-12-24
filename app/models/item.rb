class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :delivery
  after_create :update_parent
  private
    def update_parent
        order = Order.find(self.order_id)
        order.sum = 0
        Item.where(:order_id => self.order_id).each do |od|
            order.sum += od.price*od.number-od.discount
        end
        order.sum = order.sum.round(2)
        order.save
    end
end
