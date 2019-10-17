class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password_digest, :age, :budget
end
