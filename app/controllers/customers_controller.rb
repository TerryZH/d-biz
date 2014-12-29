class CustomersController < ApplicationController
    def index
        unless params[:tel].blank?
            @customers = Customer.where(:tel=>params[:tel]).order('created_at DESC').page(params[:page]).per(5)
        else
            @customers = Customer.all.order('created_at DESC').page(params[:page]).per(5)
        end
        @summary = (I18n.t 'views.customers.index.summary') % {:count=>Customer.all.count}
    end
    
    def create
        if Customer.create(customer_params).valid?
            redirect_to :action=>'index'
        else
            render :text=>"something wrong", :status=>500
        end
    end
    
    def delete
        Customer.destroy(params[:id])
        redirect_to :action=>'index'
    end
    
    respond_to :html, :xml, :json
    def details
        cods = { :customer=>nil, :address=>[], :preference=>{ :historical=>[], :last_order=>[] }, :storage=>[] }
        
        unless params[:id].blank?
          cods = { :customer=>Customer.find_by_id(params[:id]), :address=>Customer.find_address_by_id(params[:id]), :preference=>Customer.find_preference_by_id(params[:id]), :storage=>Product.get_storages }
        end
        
        unless params[:tel].blank?
          cods = { :customer=>Customer.find_by_tel(params[:tel]), :address=>Customer.find_address_by_tel(params[:tel]), :preference=>Customer.find_preference_by_tel(params[:tel]), :storage=>Product.get_storages }
        end
        
        unless params[:region].blank? and params[:location].blank?
          cods = { :customer=>Customer.find_by_addr(params[:location], params[:region]), :address=>Customer.find_address_by_addr(params[:location], params[:region]), :preference=>Customer.find_preference_by_addr(params[:location], params[:region]), :storage=>Product.get_storages }
        end
        
        respond_with cods
    end
    
    private
    def customer_params
        params.require(:customer).permit(:when_joined, :nick, :address, :tel, :email, :wechat, :weibo)
    end
end