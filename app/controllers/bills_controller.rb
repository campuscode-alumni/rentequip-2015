class BillsController < ApplicationController
  def create
    @bill = Bill.create(contract_id: params[:contract_id])
    redirect_to [@bill.contract, @bill]
  end

  def show
    @bill = Bill.find(params[:id])
  end
end
