class ChangeStatusDefaultwq < ActiveRecord::Migration[7.0]
  def change
    change_column_default :clients, :status, true
  end
end
