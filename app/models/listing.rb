class Listing < ApplicationRecord
  belongs_to :user
  has_many :booking, dependent: :destroy
  has_many :availability, dependent: :destroy
  has_one_attached :photo
end
