class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  with_options presence: true do
    validates :nickname, length: { maximum: 15 }
  end
  has_many :user_places, dependent: :destroy
  has_many :places, through: :user_places
  has_many :messages, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }, allow_blank: true

  def self.guest
    find_or_create_by!(email: 'guestlogin@example.com') do |user|
      user.nickname = Faker::Name.name
      user.password = Faker::Internet.password(min_length: 6)
    end
  end
end
