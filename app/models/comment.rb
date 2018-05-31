class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :author, presence: true, min_two_words_and_dot: {all_upcase: true}
  validates :content, presence: true
end
