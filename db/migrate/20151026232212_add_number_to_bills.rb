class AddNumberToBills < ActiveRecord::Migration
  def change
    add_column :bills, :number, :integer
  end
end
