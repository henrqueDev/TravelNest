class RoomOption < ApplicationRecord
    belongs_to :hotel
    has_many :rooms, dependent: :destroy
    has_many :hotel_reservations, dependent: :destroy
end
