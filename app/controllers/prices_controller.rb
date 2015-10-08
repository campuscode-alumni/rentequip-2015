class PricesController < ApplicationController
  def new
    @price = Price.new
  end

  def create
    @price = Price.create(price_params)
    if @price.save
      redirect_to @price
    end
  end

  def show
    @price = Price.find(params[:id])
  end


  def price_params
    params.require(:price).permit(
      :equipment,
      :time,
      :total
    )
  end

end
