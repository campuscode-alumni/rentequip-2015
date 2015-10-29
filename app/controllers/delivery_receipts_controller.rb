class deliveryReceiptsController < ApplicationController
  def create
    @delivery_receipt = DeliveryReceipts.create(contract_id: params[:contract_id])
  #  redirect_to [@delivery_receipt.contract, @delivery_receipt]
  end

  def show
    @delivery_receipt = DeliveryReceipts.find(params[:id])
  end
end
