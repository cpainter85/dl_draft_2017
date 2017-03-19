# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Round.destroy_all

Round.create(name: "Regular", number_of_rounds: 8)
Round.create(name: "Semi-Final", number_of_rounds: 1)
Round.create(name: "Final", number_of_rounds: 1)

Category.destroy_all
Category.create(name: "Athletes", minimum: 4, maximum: 8)
Category.create(name: "Sports Moments", minimum: 3, maximum: 5)
Category.create(name: "Sports Teams", minimum: 2, maximum: 2)
Category.create(name: "FLEX", minimum: 2, maximum: 2)
