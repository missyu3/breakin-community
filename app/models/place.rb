class Place < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :address
    validates :price
  end
end
