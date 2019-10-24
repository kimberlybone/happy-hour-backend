class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :category, :name, :price, :instructions, :user_name, :img_url
  has_many :ingredients
  def user_name
    self.object.user.name
  end
end
