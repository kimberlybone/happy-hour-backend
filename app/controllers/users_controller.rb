class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.valid?
      render json: user
    else
      render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
      user_id = params[:id]
      if logged_in_user_id = user_id.to_i
        user = User.find(params[:id])
        render json: user
      else
        render json: {go_away: true}, status: :unauthorized
      end
  end

  def user_params
    params.permit(:name, :age, :password, :budget)
  end
end
