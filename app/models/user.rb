class User < ApplicationRecord


  has_many :favorites, dependent: :destroy
  # has_many :recipes, through: :favorites

  # alias_attribute :drinks, :recipes
  has_many :recipes, dependent: :destroy

  validates :name, uniqueness: true

  has_secure_password
end
