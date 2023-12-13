class State < ApplicationRecord
  belongs_to :country
  has_many :cities, dependent: :destroy
  has_many :hotel_locations, dependent: :destroy

  def get_country
    self.country.pluck(:id)
  end
end
