class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.create(contract_params)
    redirect_to @contract
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private

  def contract_params
    params.require(:contract).permit(:customer_id,
                                     :rental_period_id,
                                     :payment_method,
                                     :devolution_date,
                                     :delivery_address,
                                     {:equipment_ids => []})
  end
end
