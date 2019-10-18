class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :budget, :token

  def token
    # user = User.find_by(id: params[:id])
    ApplicationController.authentication_json(:id)
  end
end
