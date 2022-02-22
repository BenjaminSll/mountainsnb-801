class Mountain < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
