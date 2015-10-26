class ContractsController < ApplicationController
  def new
    @contract = Contract.new
    @equipment = Equipment.joins(:prices)
  end

  def create
    @contract = Contract.create(contract_params)
    if @contract.save
      redirect_to @contract
    else
      flash.now[:error] = 'Atenção! Todos os campos são obrigatórios'
      render 'new'
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def index
    @contracts = Contract.all
  end

  private

  def contract_params
    params.require(:contract).permit(:customer_id,
                                     :rental_period_id,
                                     :payment_method,
                                     :delivery_address,
                                     equipment_ids: [])
  end
end
