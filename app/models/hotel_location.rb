class Location < ApplicationRecord
  belongs_to :hotel
  belongs_to :country
  belongs_to :state
  belongs_to :city
end
