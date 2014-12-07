class ItemsController < ApplicationController
    def index
        if params[:id]
          @order_id = params[:id]
          @items = Item.where(:order_id => params[:id]).group_by {|item| item.delivery_id}
          @products = Product.all.collect {|p| [ p.name, p.id ] }
          sum = 0
          @items.each {|delivery, items| items.each { |item| sum+=(item.price*item.number-item.discount) } }
          @summary = (I18n.t 'views.items.index.summary') % {:count=>@items.count, :sum=>sum}
        else
          redirect_to :controller => 'orders', :action => 'index'
        end
    end
    
    def create
        if Item.create(item_params).valid?
            redirect_to :action => 'index', :id => params[:item][:order_id]
        else
            render :text => "something wrong", :status => 500
        end
    end
    
    def delete
        Item.destroy(params[:id])
        redirect_to :action => 'index'
    end
    
    private
    def item_params
        params.require(:item).permit(:order_id, :product_id, :number, :price, :discount)
    end
end

