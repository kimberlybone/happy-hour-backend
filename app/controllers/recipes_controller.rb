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
end
