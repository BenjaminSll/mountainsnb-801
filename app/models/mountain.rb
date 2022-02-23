class Mountain < ApplicationRecord
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :photo, uniqueness: true
end
