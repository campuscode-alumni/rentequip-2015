class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      flash.now[:error] = 'Warning! All fields are mandatory.'
      render 'new'
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
  end

  private

  def customer_params
    params.require(:customer).permit(
      :name,
      :cpf,
      :address,
      :phone,
      :cell,
      :rg,
      :email,
      :birthdate
    )
  end
end
