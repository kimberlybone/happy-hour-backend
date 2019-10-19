# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

kim = User.create(name: "Kimberly", password: "1", age: 22, budget: 300)
matt = User.create(name: "Matt", password: "123", age: 27, budget: 25)

margarita = Recipe.create(category: 'Margarita', name: 'Strawberry Margarita', price: 8, user: kim)

mojito = Recipe.create(category: 'Mojito', name: 'Strawberry Mojito', price: 7, user: matt)


ingredient_json = RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
ingredient_array = JSON.parse(ingredient_json)["drinks"]
ingredient_array.each do |ingredient|
  Ingredient.create(
    name: ingredient["strIngredient1"]
  )
end

drinks_category_array = ['margarita', 'daiquiri', 'mule', 'mojito', 'sour', 'fizz', 'smash', 'flip', 'punch', 'bloody', 'brandy', 'gin', 'rum', 'tequila', 'vodka', 'martini', 'colada', 'manhattan', 'cosmopolitan', 'negroni', 'sidecar', 'long_island', 'collins']
recipes = []
drinks_category_array.each do |category|
  drinks_json = RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=' + category)
  drinks_array = JSON.parse(drinks_json)["drinks"]
  drinks_array.each do |drink|
    drink['category'] = category
  end
  recipes << drinks_array
end
recipes = recipes.flatten.uniq
# byebug
nil
