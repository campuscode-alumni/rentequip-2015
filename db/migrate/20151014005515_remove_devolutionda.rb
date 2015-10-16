class RemoveDevolutionda < ActiveRecord::Migration
  def change
    remove_column :contracts, :devolution_date, :date
  end
end
