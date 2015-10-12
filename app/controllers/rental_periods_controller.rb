class RentalPeriodsController < ApplicationController
  def new
    @rental_period = RentalPeriod.new
  end

  def create
    @rental_period = RentalPeriod.create(rental_period_params)
    redirect_to @rental_period
  end

  def show
    @rental_period = RentalPeriod.find(params[:id])
  end

  private

  def rental_period_params
    params.require(:rental_period).permit(:description, :period)
  end
end