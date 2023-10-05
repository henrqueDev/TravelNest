class Hotel < ApplicationRecord
  belongs_to :hotel_type
  has_one :location
  has_many :images
end
