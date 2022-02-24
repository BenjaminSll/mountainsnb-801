class Mountain < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  TERRAIN = ["rock", "forest", "ice"]
  DIFFICULTY = ['kids and old hikers', 'healthy hikers', 'strong joggers', 'olympic athletes and astronauts']
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price, presence: true
  validates :trails, numericality: { greater_than: 0 }
end
