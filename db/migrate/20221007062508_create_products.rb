class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.bigint :bar_code
      t.string :name
      t.string :category
      t.string :batch
      t.date :exp_date
      t.bigint :buying_price
      t.bigint :selling_price
      t.integer :units
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
