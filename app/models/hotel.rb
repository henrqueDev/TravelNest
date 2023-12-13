class Hotel < ApplicationRecord
  belongs_to :user
  belongs_to :hotel_type
  has_one :hotel_location, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :room_options, dependent: :destroy
  has_one :pix_key, dependent: :destroy
  
  accepts_nested_attributes_for :hotel_location, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :room_options, allow_destroy: true, reject_if: :all_blank

  def get_location
    self.hotel_location
  end

end
