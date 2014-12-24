class CustomersController < ApplicationController
    def index
        if params[:tel]
            @customers = Customer.where(:tel=>params[:tel]).order('created_at DESC').page(params[:page]).per(5)
        else
            @customers = Customer.all.order('created_at DESC').page(params[:page]).per(5)
        end
        @summary = (I18n.t 'views.customers.index.summary') % {:count=>Customer.all.count}
    end
    
    def create
        if Customer.create(customer_params).valid?
            redirect_to :action => 'index'
        else
            render :text => "something wrong", :status => 500
        end
    end
    
    def delete
        Customer.destroy(params[:id])
        redirect_to :action => 'index'
    end
    
    private
    def customer_params
        params.require(:customer).permit(:when_joined, :nick, :address, :tel, :email, :wechat, :weibo)
    end
end