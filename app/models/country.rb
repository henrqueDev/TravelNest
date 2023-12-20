class Country < ApplicationRecord
    has_many :states, dependent: :destroy
    has_many :hotel_locations, dependent: :destroy
end
