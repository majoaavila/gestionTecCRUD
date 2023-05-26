class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.string :sex
      t.string :position
      t.string :shift
      t.boolean :status
      t.boolean :admin
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.timestamps null: false
      t.datetime :remember_created_at
       ## Recoverable
       t.string   :reset_password_token
       t.datetime :reset_password_sent_at
    end
    add_index :employees, :email,                unique: true
    add_index :employees, :reset_password_token, unique: true
  end
end
