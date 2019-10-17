# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

kim = User.create(name: "Kimberly", password: "1", age: 22, budget: 300)
matt = User.create(name: "Matt", password: "123", age: 27, budget: 25)
