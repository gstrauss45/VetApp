class Appointment < ApplicationRecord
    has_one :user
    has_one :pet
end
