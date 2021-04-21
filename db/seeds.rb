# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES.each do |category|
  Category.find_or_create_by(name: category)
end

PRODUCTS.each do |product|
  Product.find_or_create_by(name: product[:name], ndc: product[:ndc], quantity: product[:qty], price: product[:price], instruction: product[:instructions], category: Category.find_or_create_by(name: product[:category]))
end

STATES.each do |state|
  State.find_or_create_by(name: state[0], abbreviation: state[1], service_offered: state[2], minimum_age: state[3])
end
