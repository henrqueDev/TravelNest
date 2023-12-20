class HotelType < ApplicationRecord
    has_many :hotels, dependent: :destroy
end
