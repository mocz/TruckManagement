# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
# Dispatch.delete_all
# Truck.delete_all
# Planter.delete_all
# Location.delete_all
# Plantation.delete_all

# # Create 10 locations
# 200.times do
#   Location.create(
#     barangay: Faker::Address.street_name,
#     town: Faker::Address.city,
#     area_code: Faker::Address.zip_code,
#     km_dist: Faker::Number.between(from: 1, to: 100)
#   )
# end

# # Create 10 plantations
# 300.times do
#   Plantation.create(
#     name: Faker::Company.name,
#     location_id: Location.pluck(:id).sample,
#     area: Faker::Number.between(from: 1, to: 50)
#   )
# end

# # Create 10 planters
# 200.times do
#   Planter.create(
#     name: Faker::Name.name,
#     address: Faker::Address.full_address,
#     mobile_number: Faker::PhoneNumber.cell_phone,
#     status: Faker::Lorem.word
#   )
# end

# # Create 10 trucks
# 250.times do
#   Truck.create(
#     license_plate: Faker::Vehicle.license_plate,
#     capacity: Faker::Number.between(from: 1, to: 50),
#     truck_id: Faker::Vehicle.vin
#   )
# end

# # Create 50 dispatches
# 1000.times do
#   Dispatch.create(
#     truck_id: Truck.pluck(:id).sample,
#     location_id: Location.pluck(:id).sample,
#     planter_id: Planter.pluck(:id).sample,
#     receive_date: Faker::Date.backward(days: 30),
#     gross_weight: Faker::Number.decimal(l_digits: 3, r_digits: 2),
#     status: Faker::Lorem.word,
#     description: Faker::Lorem.sentence
#   )
# end

# Create 200 drivers
200.times do
    Driver.create(
      name: Faker::Name.name,
      license_number: Faker::Vehicle.license_plate,
      address: Faker::Address.full_address,
      contact_number: Faker::PhoneNumber.cell_phone,
      status: Faker::Lorem.word,
      birthdate: Faker::Date.birthday(min_age: 18, max_age:65)
    )
  end