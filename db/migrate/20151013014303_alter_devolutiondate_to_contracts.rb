class AlterDevolutiondateToContracts < ActiveRecord::Migration
  def change
    change_column :contracts, :devolution_date, :date
  end
end
