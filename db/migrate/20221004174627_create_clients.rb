class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :Name
      t.string :LastName
      t.string :Sex
      t.date :birthDate
      t.string :email
      t.bigint :phone
      t.string :state
      t.string :city
      t.string :colony
      t.string :street
      t.string :houseNumber
      t.bigint :cp
      t.bigint :puntos
      t.boolean :status

      t.timestamps
    end
  end
end
