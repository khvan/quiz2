class User < ApplicationRecord
  has_many :ideas
  has_many :reviews
  has_many :likes

end
