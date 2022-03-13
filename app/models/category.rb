class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200}
  validates :description, presence: true, length: { maximum: 200}
end
