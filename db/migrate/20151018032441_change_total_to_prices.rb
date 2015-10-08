class ChangeTotalToPrices < ActiveRecord::Migration
  def change
    change_column :prices, :total, :float
  end
end
