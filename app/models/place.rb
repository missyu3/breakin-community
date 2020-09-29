class Place < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 15 }
    validates :address, length: { maximum: 40 }
    validates :price, length: { maximum: 50 }
  end
  validates :url, length: { maximum: 200 }

  has_many :messages, dependent: :destroy
  has_many :user_places, dependent: :destroy
  has_many :users, through: :user_places
  accepts_nested_attributes_for :user_places
  has_one_attached :image
end
