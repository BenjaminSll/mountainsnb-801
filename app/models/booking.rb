class Booking < ApplicationRecord
  belongs_to :mountain
  belongs_to :user
end
