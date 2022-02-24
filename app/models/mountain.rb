require "open-uri"

class Mountain < ApplicationRecord
  belongs_to :user

  has_one_attached :photo_url
  has_many :bookings

  before_save :add_image

  TERRAIN = ["rock", "forest", "ice"]
  DIFFICULTY = ['kids and old hikers', 'healthy hikers', 'strong joggers', 'olympic athletes and astronauts']

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def add_image
    return if photo_url.attached?

    url = "http://source.unsplash.com/collection/1705422/random"
    photo = URI.open(url)
    self.photo_url.attach(io: photo, filename: "#{self.name}.jpg")
  end
end
