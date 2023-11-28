class Room < ApplicationRecord
    belongs_to :room_option
    belongs_to :hotel
    has_one :hotel_reservation
end
