class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    redirect_to @customer if @customer.save
  end

  def show
    @customer = Customer.find(params[:id])
  end

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
