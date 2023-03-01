class Availability < ApplicationRecord
  belongs_to :booking
  belongs_to :listing, through: :booking
end
