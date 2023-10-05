class City < ApplicationRecord
  belongs_to :state
  has_many :hotel_locations
end
