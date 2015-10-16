class AddRentalperiodRefToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :rental_period, index: true, foreign_key: true
  end
end
