class AddSalaryToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :salary, :integer
  end
end
