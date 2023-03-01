class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_many :availability, dependent: :destroy
end
