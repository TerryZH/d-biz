class ProductionsController < ApplicationController
  def index
    @productions = Production.all.page(params[:page]).per(5)
    @workers = Worker.all.collect {|w| [ w.name, w.id ] }
    @products = Product.all.collect {|p| [ p.name, p.id ] }
  end

  def create
      if Production.create(production_params).valid?
          redirect_to :action => 'index'
      else
          render :text => "something wrong", :status => 500
      end
  end
  
  def delete
      Production.destroy(params[:id])
      redirect_to :action => 'index'
  end
  
  private
  def production_params
      params.require(:production).permit(:when, :who_id, :what_id, :number)
  end
end

