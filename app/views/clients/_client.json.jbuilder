json.extract! client, :id, :Name, :LastName, :Sex, :birthDate, :email, :phone, :state, :city, :colony, :street, :houseNumber, :cp, :puntos, :status, :created_at, :updated_at
json.url client_url(client, format: :json)
