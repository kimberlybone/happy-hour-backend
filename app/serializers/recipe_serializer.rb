class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :price
end
