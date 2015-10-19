class RentalPeriodsController < ApplicationController
  before_action :set_rental_period, only: [:show, :edit, :update]

  def new
    @rental_period = RentalPeriod.new
  end

  def create
    @rental_period = RentalPeriod.new(rental_period_params)
    if @rental_period.save
      redirect_to @rental_period
    else
      flash[:error] = 'Atenção! Todos os campos são obrigatórios'
      render :new
    end
  end

  def show
  end

  def index
    @rental_period = RentalPeriod.all
  end

  def edit
  end

  def update
    if @rental_period.update(rental_period_params)
      redirect_to @rental_period
    else
      if @rental_period.errors.added?(:period, :blank)
        flash[:error] = 'Atenção! Todos os campos são obrigatórios'
      else
        flash[:error] = 'Campo aceita apenas inteiros!'
      end
      render :edit
    end
  end

  private

  def set_rental_period
    @rental_period = RentalPeriod.find(params[:id])
  end

  def rental_period_params
    params.require(:rental_period).permit(:description, :period)
  end
end
