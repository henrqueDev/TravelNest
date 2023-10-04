class Hotel < ApplicationRecord
  has_one :hotel_type
  has_one :location
  has_many :images
  has_many :hosting_options
end
