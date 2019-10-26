
User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

# USERS
kim = User.create(name: "Kimberly", password: "1", age: 22, budget: 300)
matt = User.create(name: "Matt", password: "123", age: 27, budget: 25)
happyhour = User.create(name: "Happy Hour", password: "bar", age: 21, budget: 500)


# RECIPES
# margarita = Recipe.create(category: 'margarita', name: 'Strawberry Margarita', price: 8, user: kim, instructions: "Mix")
# mojito = Recipe.create(category: 'mojito', name: 'Strawberry Mojito', price: 7, user: matt, instructions: "Add alcohol")
#


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

recipes = recipes.flatten.uniq{|recipe| recipe['strDrink']}

recipes.each do |recipe|
  new_recipe = Recipe.create(
    category: recipe["category"],
    name: recipe["strDrink"],
    price: rand(7..20),
    user: happyhour,
    instructions: recipe["strInstructions"],
    img_url: recipe['strDrinkThumb']
  )
  filtered_keys = recipe.keys.filter{|key| key.include?('strIngredient') && recipe[key] != nil}
  filtered_keys.each do |key|
      RecipeIngredient.create(
        recipe: new_recipe,
        ingredient: Ingredient.find_by(name: recipe[key])
      )
  end
end

# FAVORITES
Favorite.create(user: kim, recipe: Recipe.first)
Favorite.create(user: kim, recipe: Recipe.second)
Favorite.create(user: kim, recipe: Recipe.third)
Favorite.create(user: kim, recipe: Recipe.fourth)
Favorite.create(user: kim, recipe: Recipe.fifth)

Favorite.create(user: matt, recipe: Recipe.all[5])
Favorite.create(user: matt, recipe: Recipe.all[6])
Favorite.create(user: matt, recipe: Recipe.all[7])
Favorite.create(user: matt, recipe: Recipe.all[8])
Favorite.create(user: matt, recipe: Recipe.all[9])

# More ingredients
Ingredient.create(name: 'Mint')
Ingredient.create(name: 'Honey')
Ingredient.create(name: 'Club Soda')
Ingredient.create(name: 'Olives')
Ingredient.create(name: 'Salt')
Ingredient.create(name: 'Tonic')
Ingredient.create(name: 'Ginger Ale')
Ingredient.create(name: 'Cola')
Ingredient.create(name: 'Ginger Beer')
Ingredient.create(name: 'Simple Syrup')
Ingredient.create(name: 'Ice')
Ingredient.create(name: 'Cherries')
Ingredient.create(name: 'Orange Juice')
Ingredient.create(name: 'Absinthe')
Ingredient.create(name: 'Raspberries')
Ingredient.create(name: 'Raspberry Liqueur')
Ingredient.create(name: 'White Wine')
Ingredient.create(name: 'Agave Syrup')
Ingredient.create(name: 'Peach Schnapps')
Ingredient.create(name: 'Coconut Rum')
Ingredient.create(name: 'Basil Leaves')
Ingredient.create(name: 'Sake')
Ingredient.create(name: 'Prosecco')
Ingredient.create(name: 'Passion Fruit')
Ingredient.create(name: 'Cucumber')
Ingredient.create(name: 'Hennessy')

# byebug
# nil
