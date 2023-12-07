class RoomOption < ApplicationRecord
    belongs_to :hotel
    has_many :rooms
    has_many :hotel_reservations
end
