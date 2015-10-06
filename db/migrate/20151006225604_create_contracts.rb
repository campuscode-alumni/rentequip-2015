class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :customer
      t.string :equipment
      t.string :time
      t.string :payment_method
      t.string :devolution_date
      t.string :delivery_address

      t.timestamps null: false
    end
  end
end
