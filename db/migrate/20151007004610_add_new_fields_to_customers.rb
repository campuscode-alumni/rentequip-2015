class AddNewFieldsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :address, :string
    add_column :customers, :phone, :string
    add_column :customers, :cell, :string
    add_column :customers, :rg, :string
    add_column :customers, :email, :string
    add_column :customers, :birthdate, :string
  end
end
