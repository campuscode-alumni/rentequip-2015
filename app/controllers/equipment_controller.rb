class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update]

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.create(equipment_params)
    if @equipment.valid?
      redirect_to @equipment
    else
      flash[:error] = 'Categoria é obrigatória.'
      render 'new'
    end
  end

  def show
  end

  def with_price
    @equipment = Equipment.joins(:prices).uniq
      .where(prices: {rental_period_id: params[:rental_period_id]})
    render json: @equipment.to_json(only: [:id],include: {equipment_category: {only:[],methods: :to_s}})
  end

  def index
    @equipment = Equipment.all
  end

  def edit
  end

  def update
    if @equipment.update(equipment_params)
      redirect_to @equipment
    else
      flash[:error] = 'Atenção! Todos os campos são obrigatórios'
      render :edit
    end
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:equipment_category_id, :supplier, :price,
                                      :asset_number, :purchased_at,
                                      :acquisition_price)
  end
end
