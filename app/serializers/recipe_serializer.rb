class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :category, :name, :price, :instructions
  has_many :ingredients

end
