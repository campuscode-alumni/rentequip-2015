class PricesController < ApplicationController
  def new
    @price = Price.new
  end

  def create
    @price = Price.create(price_params)
    if @price.save
      redirect_to @price
    else
      flash.now[:error] = 'Warning! All fields are mandatory.'
      render 'new'
    end
  end

  def show
    @price = Price.find(params[:id])
  end

  private

  def price_params
    params.require(:price).permit(:equipment_id, :rental_period_id, :total)
  end
end
