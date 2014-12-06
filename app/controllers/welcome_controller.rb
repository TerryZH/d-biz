class WelcomeController < ApplicationController
    def index
        @profit_total=0
        @amount_total=0
        refresh_profit_history
        Profit.all.each do |p|
            @profit_total+=p.profit
            @amount_total+=p.amount
        end
        @profit_total = @profit_total.round(2)
        @amount_total = @amount_total.round(2)
        @profits = Profit.all.order('created_at DESC').page(params[:page]).per(5)

        @storages = get_storage
        @made_total = Production.sum("number").round(2)
        @sold_total = Orderdetail.sum("number").round(2)
        @left_total = (@made_total-@sold_total).round(2)
        
        prepare_lists
        
        o = Order.last
        @orderdetails = Orderdetail.where(:order_id => o.id)
        @lastorder = (I18n.t 'views.welcome.index.lastorder') % {:price=>o.sum, :address=>Customer.find_by_id(o.who_id).address}
        @iocomp = (I18n.t 'views.welcome.index.iocomp') % {:input=>(Promotion.sum("sum")+Material.sum("sum")).round(2), :input_p=>Promotion.sum("sum").round(2), :input_m=>Material.sum("sum").round(2), :output=>Order.sum("sum").round(2)}

    end
    
    def refresh_profit_history
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
                p = Profit.find_by_when(today) || Profit.new
                p.when = today
                p.profit = profit_today
                p.amount = amount_today
                p.save
            end
            today += 1.day
        end
    end

    def get_storage
        magic_num = 0.5
        storages = Array.new
        Product.all.each do |p|
            made = Production.where("what_id = ?", p.id).sum("number")
            sold = Orderdetail.where("product_id = ?", p.id).sum("number")
            storages.insert -1, {
                :product => p.name,
                :made => made.round(2),
                :sold => sold.round(2),
                :left => (made-sold).round(2),
                :prio => (sold/(sold+magic_num)/(made-sold+magic_num)*100).round,
            }
        end
        return storages
    end
    
    def prepare_lists
        @neighbourhoods = [['北京新天地','北京新天地']];
        @districts = [['1期','1期'],['2期','2期'],['3期','3期'],['4期','4期']];
        @buildings = [['1号楼','1号楼'],['3号楼','3号楼'],['6号楼','6号楼'],['7号楼','7号楼'],['8号楼','8号楼'],['11号楼','11号楼'],['12号楼','12号楼'],['16号楼','16号楼']];
        @units = [['1单元','1单元'],['2单元','2单元'],['3单元','3单元'],['4单元','4单元']];
        @floors = [['1层','1'],['2层','2'],['3层','3'],['4层','4'],['5层','5'],['6层','6'],['7层','7'],['8层','8'],['9层','9'],['10层','10'],['11层','11'],['12层','12'],['13层','13'],['14层','14'],['15层','15'],['16层','16'],['17层','17'],['18层','18'],['19层','19'],['20层','20'],['21层','21'],['22层','22'],['23层','23'],['24层','24'],['25层','25'],['26层','26'],['27层','27'],['28层','28']];
        @rooms = [['01室','01'],['02室','02'],['03室','03'],['05室','05'],['06室','06']];
        @products = Product.all.collect {|p| [ p.name, p.id ] }
        @numbers = [['0份',0],['半份',0.1],['1份',0.2],['1份半',0.3],['2份',0.4],['2份半',0.5],['3份',0.6],['3份半',0.7],['4份',0.8],['4份半',0.9],['5份',1.0]];
        @cooked =[["不煮",0],["煮熟",1]];
    end
    
    def create_new_order
        prices = {
            1 => 10,
            2 => 9,
            3 => 10,
            4 => 12,
            5 => 13,
            6 => 13,
            7 => 13,
        };

        addr = params[:new_order][:neighbourhood] \
             + params[:new_order][:district] \
             + params[:new_order][:building] \
             + params[:new_order][:unit] \
             + params[:new_order][:floor] \
             + params[:new_order][:room]
        c = Customer.find_by_address(addr) ||
            Customer.create(:when_joined => Date.today,
                            :nick => "",
                            :address => addr,
                            :tel => params[:new_order][:tel],
                            :email => "",
                            :wechat => "",
                            :weibo => "")
        valid_order = false
        (0..9).each { |i| valid_order ||= (params[:new_order][("number"+i.to_s).to_sym].to_f != 0) }
        if valid_order
          o = Order.create(:when => Date.today,
                           :who_id => c.id,
                           :sum => 0)
          (0..9).each do |i|
            n = params[:new_order][("number"+i.to_s).to_sym].to_f
            p = params[:new_order][("product"+i.to_s).to_sym].to_i
            if n != 0
              Orderdetail.create(:order_id => o.id,
                                 :product_id => p,
                                 :number => n,
                                 :price => (prices[p] + params[:new_order][("cooked"+i.to_s).to_sym].to_f)*5,
                                 :discount => params[:new_order][("discount"+i.to_s).to_sym].to_f)
            end
          end
        end
        redirect_to :action => 'index'
    end
end
