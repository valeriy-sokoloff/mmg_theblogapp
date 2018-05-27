class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :name, presence: true, min_two_words_and_dot: {all_upcase: true}
end
