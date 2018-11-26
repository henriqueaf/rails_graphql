class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :sessions

  validates_presence_of :first_name, :last_name
end
