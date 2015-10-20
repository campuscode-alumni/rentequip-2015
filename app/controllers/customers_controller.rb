class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

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
  end

  def index
    @customers = Customer.all
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      flash[:error] = 'Atenção! Todos os campos são obrigatórios'
      render :edit
    end
  end

  private

  def set_customer
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
