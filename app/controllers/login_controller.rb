class LoginController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      render json: authentication_json(user.id)
    else
      render json: {errors: ["Invalid username or password."]}, status: :unprocessable_entity
    end
  end
end
