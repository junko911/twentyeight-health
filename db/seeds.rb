# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES.each do |name|
  Category.find_or_create_by(name: name)
end

PRODUCTS.each do |product|
  Product.find_or_create_by(
    name: product[:name], 
    ndc: product[:ndc], 
    qty: product[:qty], 
    price: product[:price], 
    instructions: product[:instructions], 
    category: Category.find_by!(name: product[:category])
  )
end

STATES.each do |state|
  name, abbreviation, service_offered, minimum_age = state

  State.find_or_create_by(
    name: name, 
    abbreviation: abbreviation, 
    service_offered: service_offered, 
    minimum_age: minimum_age
  )
end
