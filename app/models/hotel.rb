class Hotel < ApplicationRecord
  belongs_to :user
  belongs_to :hotel_type
  has_one :hotel_location
  has_many_attached :images

  accepts_nested_attributes_for :hotel_location, :allow_destroy => true
  
  def get_location
    self.hotel_location
  end
end
