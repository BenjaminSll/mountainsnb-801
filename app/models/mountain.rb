class Mountain < ApplicationRecord
  has_one_attached :photo
  TERRAIN = ["rock", "forest", "ice"]
  DIFFICULTY = ['kids and old hikers', 'healthy hikers', 'strong joggers', 'olympic athletes and astronauts']

  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

end
