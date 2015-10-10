class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :equipment
      t.string :time
      t.decimal :total

      t.timestamps null: false
    end
  end
end
