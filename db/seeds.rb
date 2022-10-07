# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
   proveedor =  Supplier.create name:Faker::Commerce.brand, email:Faker::Internet.email, phone:Faker::PhoneNumber.phone_number,arrive_date:Faker::Date.forward(days: 2),rfc:Faker::Code.nric
    Product.create bar_code:Faker::Number.number(digits: 5), name:Faker::Commerce.product_name,category:Faker::Commerce.department,batch:Faker::Alphanumeric.alpha(number: 10),exp_date:Faker::Date.forward(days: 23),buying_price:Faker::Commerce.price, selling_price: Faker::Commerce.price,supplier_id:proveedor.id, units:Faker::Number.number(digits: 2)
    Client.create Name:Faker::Name.first_name,LastName:Faker::Name.last_name, Sex: Faker::Gender.type, birthDate: Faker::Date.birthday(min_age: 18, max_age: 65), email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, state: Faker::Address.state, city: Faker::Address.city, colony: Faker::Address.community, street: Faker::Address.street_name, houseNumber: Faker::Address.building_number, cp: Faker::Address.zip_code, puntos: Faker::Number.number(digits: 3), status: Faker::Boolean.boolean
    Employee.create name:Faker::Name.first_name,last_name:Faker::Name.last_name, sex: Faker::Gender.type, position: Faker::Job.title, shift: Faker::Job.field, status: Faker::Boolean.boolean, salary: Faker::Number.number(digits: 4)
end
