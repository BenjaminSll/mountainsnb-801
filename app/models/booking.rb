class Booking < ApplicationRecord
  belongs_to :mountain
  belongs_to :user
  # validates :status, default: false
  before_save :calcul_price

  def calcul_price
    self.total_price = (self.departure - self.arrival) * self.mountain.price
  end
end
