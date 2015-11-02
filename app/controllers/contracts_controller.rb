class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      params[:contract][:equipment_ids].each do |id|
        @contract.rented_equipments.create(equipment_id: id)
      end
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

  def delivery_receipt
    @contract = Contract.find(params[:id])
  end

  private

  def contract_params
    params.require(:contract).permit(:customer_id,
                                     :rental_period_id,
                                     :payment_method,
                                     :delivery_address)
  end
end
