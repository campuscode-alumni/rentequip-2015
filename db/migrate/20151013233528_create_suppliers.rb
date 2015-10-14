class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :cnpj
      t.string :account_manager
      t.string :company_name
      t.string :email
      t.string :phone
      t.string :website
      t.string :municipal_registration
      t.string :state_registration

      t.timestamps null: false
    end
  end
end
