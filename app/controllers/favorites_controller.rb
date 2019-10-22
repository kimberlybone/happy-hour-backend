class FavoritesController < ApplicationController

  def create
    favorite = Favorite.create(recipe_id: params[:recipe_id], user_id: params[:user_id])
    if favorite.valid?
      render json: favorite
    else
      render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
