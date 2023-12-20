class Room < ApplicationRecord
    belongs_to :room_option
    belongs_to :hotel
    has_many :hotel_reservations, dependent: :destroy
end
