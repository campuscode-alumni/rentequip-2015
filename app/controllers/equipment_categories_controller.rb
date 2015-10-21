class EquipmentCategoriesController < ApplicationController
  def new
    @equipment_category = EquipmentCategory.new
  end

  def create
    @equipment_category = EquipmentCategory.new(equipment_category_params)
    if @equipment_category.save
      redirect_to @equipment_category
    else
      flash[:error] = 'Tipo é obrigatório'
      render 'new'
    end
  end

  def show
     @equipment_category = EquipmentCategory.find(params[:id])
  end

  def index
    @equipment_categories = EquipmentCategory.all
  end

  private
  def equipment_category_params
    params.require(:equipment_category).permit(:name, :model)
  end
end
