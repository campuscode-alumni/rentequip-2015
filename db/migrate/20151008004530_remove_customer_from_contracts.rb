class RemoveCustomerFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :customer, :string
  end
end
