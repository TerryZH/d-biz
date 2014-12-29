class Profit < ActiveRecord::Base
    def self.refresh
        if Profit.exists?
            today = Profit.last.when
        else
            today = Order.first.when
        end
        
        while today <= Date.today do
            products_today = Item.joins(:order).where('orders.when' => today)
            if products_today.count != 0
                profit_today = 0
                amount_today = 0
                products_today.each do |p|
                    profit_today+=p.number*(p.price-p.cost)-p.discount
                    amount_today+=p.number*p.price-p.discount
                end
                profit_today = profit_today.round(2)
                amount_today = amount_today.round(2)
                p = Profit.find_by_when(today) || Profit.new
                p.when = today
                p.profit = profit_today
                p.amount = amount_today
                p.save
            end
            today += 1.day
        end
    end
end
