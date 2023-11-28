class RoomOption < ApplicationRecord
    belongs_to :hotel
    has_many :hotel_reservations
end
