class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to @supplier
    else
      flash.now[:error] = "Warning! Name and CNPJ fields are mandatory."
      render 'new'
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(
      :name,
      :address,
      :cnpj,
      :account_manager,
      :company_name,
      :email,
      :phone,
      :website,
      :municipal_registration,
      :state_registration
    )
  end
end
