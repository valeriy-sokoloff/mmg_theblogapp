class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :delete_all

  validates :name, presence: true, min_two_words_and_dot: true
end
