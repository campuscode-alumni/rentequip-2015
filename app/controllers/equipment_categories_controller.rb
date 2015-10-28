class EquipmentCategoriesController < ApplicationController
  before_action :set_equipment_category, only: [:show, :edit, :update]
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
  end

  def index
    @equipment_categories = EquipmentCategory.all
  end

  def edit
  end

  def update
    if @equipment_category.update(equipment_category_params)
      redirect_to @equipment_category
    else
      flash[:error] = 'Tipo é obrigatório.'
      render :edit
    end
  end

  private

  def set_equipment_category
    @equipment_category = EquipmentCategory.find(params[:id])
  end

  def equipment_category_params
    params.require(:equipment_category).permit(:name, :model, :mark)
  end
end
