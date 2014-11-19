class OrderdetailsController < ApplicationController
    def index
        if params[:id]
          @order_id = params[:id]
          @orderdetails = Orderdetail.where(:order_id => params[:id])
          @products = Product.all.collect {|p| [ p.name, p.id ] }
        else
          redirect_to :controller => 'orders', :action => 'index'
        end
    end
    
    def create
        if Orderdetail.create(orderdetail_params).valid?
            redirect_to :action => 'index', :id => params[:orderdetail][:order_id]
        else
            render :text => "something wrong", :status => 500
        end
    end
    
    def delete
        Orderdetail.destroy(params[:id])
        redirect_to :action => 'index'
    end
    
    private
    def orderdetail_params
        params.require(:orderdetail).permit(:order_id, :product_id, :number, :price, :discount)
    end
end

