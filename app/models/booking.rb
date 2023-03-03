class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_many :availability, dependent: :destroy

  #enable @book.reviews
  has_many :reviews, dependent: :destroy
end
