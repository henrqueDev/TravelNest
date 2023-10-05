class Country < ApplicationRecord
    has_many :states
    has_many :hotel_locations
end
