class RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    recipes = recipes.shuffle
    render json: recipes
  end

  def show
    recipe = Recipe.find_by(id: params[:id])
    render json: recipe
  end

  def create
    recipe = Recipe.create(user_id: params[:user_id], name: params[:name], category: params[:category], instructions: params[:instructions], price: rand(7..15))
    if recipe.valid?
      params[:ingredients].each do |ingredient|
        RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: Ingredient.find_by(name: ingredient).id)
      end
      render json: recipe
    else
      render json: {hi: 'hi'}
    end
  end

end
