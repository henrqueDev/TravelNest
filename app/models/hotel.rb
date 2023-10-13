class Hotel < ApplicationRecord
  belongs_to :hotel_type
  has_one :hotel_location
  has_many :hotel_images

  def image_urls
    self.hotel_images.pluck(:url)
  end

  def get_location
    self.hotel_location
  end
end
