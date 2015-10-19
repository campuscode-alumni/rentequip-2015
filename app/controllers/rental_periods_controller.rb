class RentalPeriodsController < ApplicationController
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
    @rental_period = RentalPeriod.find(params[:id])
  end

  def index
    @rental_period = RentalPeriod.all
  end

  def edit
    @rental_period = RentalPeriod.find(params[:id])
  end

  def update
    @rental_period = RentalPeriod.find(params[:id])
    @rental_period.update(rental_period_params)
    if @rental_period.save
      redirect_to @rental_period
    else
      unless @rental_period.errors.added?(:period, :blank)
        flash[:error] = 'Campo aceita apenas inteiros!'
      else
        flash[:error] = 'Atenção! Todos os campos são obrigatórios'
      end
      render :edit
    end
  end

  private
  def rental_period_params
    params.require(:rental_period).permit(:description, :period)
  end
end
