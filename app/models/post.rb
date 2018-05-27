class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable

  validates_presence_of :name

end
