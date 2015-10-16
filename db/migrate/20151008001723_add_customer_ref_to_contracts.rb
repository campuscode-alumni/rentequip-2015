class AddCustomerRefToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :customer, index: true, foreign_key: true
  end
end
