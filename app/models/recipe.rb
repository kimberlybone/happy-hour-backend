class Recipe < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  # has_many :users, through: :favorites

  belongs_to :user
  # belongs_to :creator, :class_name => "User"
end
