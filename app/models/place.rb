class Place < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :address
    validates :price
  end
  has_many :users, through: :user_places
  has_many :user_places
end
