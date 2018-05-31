class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :delete_all

  has_one_attached :file
  MAX_FILE_SIZE = 2.megabytes

  validates :name, presence: true, min_two_words_and_dot: true
  validate :file_size_validation

  private
  def file_size_validation
    if file.attached?
      if file.blob.byte_size > MAX_FILE_SIZE
        file.purge
        errors[:base] << "Allowed file size is #{MAX_FILE_SIZE} bytes max"
      end
    end
  end
end
