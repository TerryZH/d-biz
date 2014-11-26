class MaterialsController < ApplicationController
  def index
    @materials = Material.all.page(params[:page]).per(5)
    @summary = (I18n.t 'views.materials.index.summary') % {:count=>Material.all.count, :sum=>Material.sum("sum")}
  end

  def create
    if Material.create(material_params).valid?
      redirect_to :action => 'index'
    else
      render :text => "something wrong", :status => 500
    end
  end
  
  def delete
      Material.destroy(params[:id])
      redirect_to :action => 'index'
  end
  
  private
  def material_params
      params.require(:material).permit(:when, :what, :sum, :price)
  end
end
