class User < ApplicationRecord

  validates :name, uniqueness: true

  has_secure_password
end
