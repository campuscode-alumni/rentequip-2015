class RemoveTimeToContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :time, :string
  end
end
