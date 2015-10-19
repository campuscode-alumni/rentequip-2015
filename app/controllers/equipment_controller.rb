class EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.create(equipment_params)
    if @equipment.valid?
      redirect_to @equipment
    else
      flash[:error] = 'Nome é obrigatório'
      render 'new'
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def index
    @equipment = Equipment.all
  end

  private

  def equipment_params
    params.require(:equipment).permit(
      :name, :mark, :supplier, :price, :model,
      :asset_number, :purchased_at, :acquisition_price
    )
  end
end
