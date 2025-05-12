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
Comment.destroy_all
Rating.destroy_all
WorkLocation.destroy_all
LocationType.destroy_all

# Create Location Types
coffee_shop = LocationType.create!(descriptor: "Coffee Shop")
coworking_space = LocationType.create!(descriptor: "Coworking Space")
library = LocationType.create!(descriptor: "Library")

# Create Work Locations
central_perk = WorkLocation.create!(
  name: "Central Perk",
  location_type: coffee_shop,
  city: "New York",
  state: "NY",
  zip_code: "10001",
  address: "90 Bedford St",
  latitude: "40.732013",
  longitude: "-73.998649",
  description: "A cozy coffee shop with great ambiance.",
  phone_number: "123-456-7890",
  requires_purchase: true,
  membership: false,
  website: "http://centralperk.com",
  owner_id: 1
)

wework_downtown = WorkLocation.create!(
  name: "WeWork Downtown",
  location_type: coworking_space,
  city: "San Francisco",
  state: "CA",
  zip_code: "94105",
  address: "600 California St",
  latitude: "37.791000",
  longitude: "-122.399972",
  description: "A modern coworking space with excellent facilities.",
  phone_number: "987-654-3210",
  requires_purchase: false,
  membership: true,
  website: "http://wework.com",
  owner_id: 2
)

city_library = WorkLocation.create!(
  name: "City Library",
  location_type: library,
  city: "Chicago",
  state: "IL",
  zip_code: "60605",
  address: "400 S State St",
  latitude: "41.876400",
  longitude: "-87.628000",
  description: "A quiet library with plenty of resources.",
  phone_number: "555-555-5555",
  requires_purchase: false,
  membership: false,
  website: "http://citylibrary.com",
  owner_id: 3
)

# Create Comments for Work Locations
Comment.create!(
  content: "Great place to work!",
  location_id: central_perk.id
)

Comment.create!(
  content: "Very quiet and peaceful.",
  location_id: city_library.id
)

Comment.create!(
  content: "Good facilities but a bit crowded.",
  location_id: wework_downtown.id
)

# Create Ratings for Work Locations
Rating.create!(
  score: 5,
  location_id: central_perk.id
)

Rating.create!(
  score: 4,
  location_id: city_library.id
)

Rating.create!(
  score: 3,
  location_id: wework_downtown.id
)

puts "Sample data created successfully!"
