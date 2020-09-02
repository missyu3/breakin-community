class Place < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :address, length: { maximum: 80 }
    validates :price, length: { maximum: 100 }
  end
  has_many :messages
  has_many :user_places
  has_many :users, through: :user_places
  accepts_nested_attributes_for :user_places
  has_one_attached :image
end
