class EquipmentController < ApplicationController
  before_action :load_equipment, only: [:show, :edit, :update]
  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.create(equipment_params)
    if @equipment.valid?
      redirect_to @equipment
    else
      flash[:error] = "Nome é obrigatório"
      render 'new'
    end
  end

  def show
  end

  def index
    @equipment = Equipment.all
  end

  def edit
  end

  def update
    @equipment.update! equipment_params
    redirect_to @equipment
  end

  private
  def equipment_params
    params.require(:equipment).permit(:name, :mark, :supplier, :price, :model, :asset_number, :purchased_at, :acquisition_price)
  end

  def load_equipment
    @equipment = Equipment.find(params[:id])
  end
end
