class Listing < ApplicationRecord
  belongs_to :user
  has_many :booking, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
end
