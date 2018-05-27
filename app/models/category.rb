class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :delete_all

  validates_presence_of :name

end
