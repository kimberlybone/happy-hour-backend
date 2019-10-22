class FavoritesController < ApplicationController
  def index
    favorites = Favorite.all
    render json: favorites
  end

  def create
    favorite = Favorite.create(recipe_id: params[:recipe_id], user_id: params[:user_id])
    if favorite.valid?
      user = User.find(params[:user_id])
      render json: user, include: '**'
    else
      render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
