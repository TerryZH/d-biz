class OrdersController < ApplicationController
    def index
        if params[:c_id].blank?
            @orders = Order.all.order('created_at DESC').page(params[:page]).per(5)
            @summary = (I18n.t 'views.orders.index.summary') % {:count=>Order.all.count, :sum=>Order.sum("sum")}
        else
            @orders = Order.where(:who_id=>params[:c_id]).order('created_at DESC').page(params[:page]).per(5)
            @products = Product.all.collect {|p| [ p.name, p.id ] }
            @cos_url = url_for :controller => "customers", :action => "details", :id=>params[:c_id], :format => "json"
        end
    end
    
    def create
        if Order.create(order_params).valid?
            redirect_to :action => 'index'
        else
            render :text => "something wrong", :status => 500
        end
    end
    
    def delete
        Order.destroy(params[:id])
        redirect_to :action => 'index'
    end
    
    private
    def order_params
        params.require(:order).permit(:when, :who_id, :sum)
    end
end

