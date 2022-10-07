class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.string :sex
      t.string :position
      t.string :shift
      t.boolean :status

      t.timestamps
    end
  end
end
