class Orderdetail < ActiveRecord::Base
  belongs_to :order
  after_create :update_parent
  private
    def update_parent
        order = Order.find(self.order_id)
        order.sum = 0
        Orderdetail.where(:order_id => self.order_id).each do |od|
            order.sum += od.price*od.number-od.discount
        end
        order.save
    end
end
