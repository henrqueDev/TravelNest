class Person < ApplicationRecord
    has_one :room
    has_one :person_type
end
