class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :delete_all

  validates :name, presence: true, min_two_words_and_dot: true
end
