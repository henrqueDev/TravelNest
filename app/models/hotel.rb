class Hotel < ApplicationRecord
  belongs_to :hotel_type
  has_one :hotel_location
  has_many :hotel_images
end
