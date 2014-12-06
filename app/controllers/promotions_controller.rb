class PromotionsController < ApplicationController
    def index
        @promotions = Promotion.all.order('created_at DESC').page(params[:page]).per(5)
        @summary = (I18n.t 'views.promotions.index.summary') % {:count=>Promotion.all.count, :sum=>Promotion.sum("sum")}
    end
    
    def create
        if Promotion.create(promotion_params).valid?
            redirect_to :action => 'index'
        else
            render :text => "something wrong", :status => 500
        end
    end
    
    def delete
        Promotion.destroy(params[:id])
        redirect_to :action => 'index'
    end
    
    private
    def promotion_params
        params.require(:promotion).permit(:when, :what, :sum, :number)
    end
end
