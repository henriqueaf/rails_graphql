class User < ApplicationRecord
  has_many :posts

  validates_presence_of :first_name, :last_name
end
