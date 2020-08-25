class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
          validates :nickname
         end
         has_many :user_places
         has_many :places, through: :user_places
         has_many :messages
end
