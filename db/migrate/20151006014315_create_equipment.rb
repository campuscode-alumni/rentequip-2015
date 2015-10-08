class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :mark
      t.string :supplier
      t.float :price
      t.string :model
      t.integer :asset_number
      t.date :purchased_at
      t.float :acquisition_price

      t.timestamps null: false
    end
  end
end
