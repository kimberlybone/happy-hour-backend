class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :budget
  has_many :favorites

end
