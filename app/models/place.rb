class Place < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :address
    validates :price
  end
  has_many :messages
  has_many :user_places
  has_many :users, through: :user_places
  accepts_nested_attributes_for :user_places
end
