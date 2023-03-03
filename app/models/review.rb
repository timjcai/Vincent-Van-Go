class Review < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  # @review.booking
  validates :content, length: {minimum: 10}
end
