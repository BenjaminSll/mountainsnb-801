require "open-uri"

class Mountain < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo_url

  before_save :add_image

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :trails, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true }
    }

  TERRAIN = ["rock", "forest", "ice"]
  DIFFICULTY = ['kids and old hikers', 'healthy hikers', 'strong joggers', 'olympic athletes and astronauts']


  def add_image
    return if photo_url.attached?

    url = "http://source.unsplash.com/collection/1705422/random"
    photo = URI.open(url)
    self.photo_url.attach(io: photo, filename: "#{self.name}.jpg")
  end

end
