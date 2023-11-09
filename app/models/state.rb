class State < ApplicationRecord
  belongs_to :country
  has_many :cities
  has_many :hotel_locations

  def get_country
    self.country.pluck(:id)
  end
end
