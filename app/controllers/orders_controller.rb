class OrdersController < ApplicationController
    def index
        @orders = Order.all
        @customers = Customer.all.collect {|c| [ c.address, c.id ] }
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

