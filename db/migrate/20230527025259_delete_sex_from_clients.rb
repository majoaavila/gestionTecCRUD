class DeleteSexFromClients < ActiveRecord::Migration[7.0]
  def change
    #Delete the sex column from clients table
    remove_column :clients, :Sex
    remove_column :employees, :sex
  end
end
