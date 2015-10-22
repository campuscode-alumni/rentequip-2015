class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update]

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to @supplier
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @suppliers = Supplier.all
  end

  def edit
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier
    else
      render :edit
    end
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(
      :name, :address, :cnpj,
      :account_manager, :company_name, :email,
      :phone, :website, :municipal_registration,
      :state_registration
    )
  end
end
