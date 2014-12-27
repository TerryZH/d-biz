class WelcomeController < ApplicationController
    def index
        @profit_total=0
        @amount_total=0
        Profit.refresh
        Profit.all.each do |p|
            @profit_total+=p.profit
            @amount_total+=p.amount
        end
        @profit_total = @profit_total.round(2)
        @amount_total = @amount_total.round(2)
        @profits = Profit.all.order('created_at DESC').page(params[:page]).per(5)

        @storages = Product.get_storages
        @made_total = Production.sum("number").round(2)
        @sold_total = Item.sum("number").round(2)
        @left_total = (@made_total-@sold_total).round(2)
        
        prepare_lists
        
        o = Order.last
        @items = Item.where(:order_id => o.id).group_by {|item| item.delivery_id}
        @lastorder = (I18n.t 'views.welcome.index.lastorder') % {:price=>o.sum, :change=>(110-o.sum).round(2)}
        @iocomp = (I18n.t 'views.welcome.index.iocomp') % {:input=>(Promotion.sum("sum")+Material.sum("sum")).round(2), :input_p=>Promotion.sum("sum").round(2), :input_m=>Material.sum("sum").round(2), :output=>Order.sum("sum").round(2), :cashflow=>(Order.sum("sum")-Promotion.sum("sum")-Material.sum("sum")).round(2)}
        @debug_mode_off = (Rails.env=="production")

    end
    
    def create_new_order
        Order.process_new_order(params)
        redirect_to :action => 'index'
    end

    def prepare_lists
        @neighbourhoods = [['北京新天地','北京新天地'],['京通苑','京通苑']];
        @districts = [['-',''],['1期','1期'],['2期','2期'],['3期','3期'],['4期','4期'],['5期','5期']];
        @buildings = [['1号楼','1号楼'],['3号楼','3号楼'],['5号楼','5号楼'],['6号楼','6号楼'],['7号楼','7号楼'],['8号楼','8号楼'],['9号楼','9号楼'],['10号楼','10号楼'],['11号楼','11号楼'],['12号楼','12号楼'],['15号楼','15号楼'],['16号楼','16号楼'],['17号楼','17号楼'],['18号楼','18号楼'],['19号楼','19号楼'],['20号楼','20号楼']];
        @units = [['-',''],['1单元','1单元'],['2单元','2单元'],['3单元','3单元'],['4单元','4单元']];
        @floors = [['1层','1'],['2层','2'],['3层','3'],['4层','4'],['5层','5'],['6层','6'],['7层','7'],['8层','8'],['9层','9'],['10层','10'],['11层','11'],['12层','12'],['13层','13'],['14层','14'],['15层','15'],['16层','16'],['17层','17'],['18层','18'],['19层','19'],['20层','20'],['21层','21'],['22层','22'],['23层','23'],['24层','24'],['25层','25'],['26层','26'],['27层','27'],['28层','28']];
        @rooms = [['01室','01'],['02室','02'],['03室','03'],['05室','05'],['06室','06'],['08室','08']];
        @products = Product.all.collect {|p| [ p.name, p.id ] }
        @numbers = [['0份',0],['1份',10],['2份',20],['半份',5],['1份半',15],['2份半',25],['5份',50],['3份',30],['1个',1],['2个',2],['3个',3],['4个',4]];
        @cooked =[["不煮",0],["煮熟",1],["试吃",2]];
    end
end
