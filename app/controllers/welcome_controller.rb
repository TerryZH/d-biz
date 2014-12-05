class WelcomeController < ApplicationController
    def index
        @profit_total=0
        @amount_total=0
        @profits = get_profit_history
        @profits.each do |p|
            @profit_total+=p.profit
            @amount_total+=p.amount
        end
        @profit_total = @profit_total.round(2)
        @amount_total = @amount_total.round(2)
    end
    
    def get_profit_history
        profit_rate = {
            1 => 0.68,
            2 => 0.71,
            3 => 0.62,
            4 => 0.58,
            5 => 0.57,
            6 => 0.62,
            7 => 0.69,
        };
        
        if Profit.exists?
            today = Profit.last.when
        else
            today = Order.first.when
        end

        while today <= Date.today do
            profit_today = 0
            amount_today = 0
            products_today = Orderdetail.joins(:order).where('orders.when' => today)
            products_today.each do |p|
                profit_today+=p.number*p.price*profit_rate[p.product_id]-p.discount
                amount_today+=p.number*p.price-p.discount
            end
            if amount_today != 0
                profit_today = profit_today.round(2)
                amount_today = amount_today.round(2)
                if Profit.find_by_when(today)
                    Profit.find_by_when(today).update_attributes(:profit=>profit_today, :amount=>amount_today)
                else
                    Profit.create(when:today, profit:profit_today, amount:amount_today)
                end
            end
            today += 1.day
        end
        
        return Profit.all
    end
end
