class Place < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 15 }
    validates :address, length: { maximum: 40 }
    validates :price, length: { maximum: 50 }
  end

  URL_REGEX = /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/.freeze
  validates :url, length: { maximum: 50 }, format: { with: URL_REGEX, message: 'にはhttpまたはhttpsを含む必要があります' }, allow_blank: true
  validates :remark, length: { maximum: 80 }

  has_many :messages, dependent: :destroy
  has_many :user_places, dependent: :destroy
  has_many :users, through: :user_places
  accepts_nested_attributes_for :user_places # place保存にuser_placeも保存される
  validates :lat, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  has_one_attached :image
  validate :image_content_type, if: :was_attached?
  # was_attachedの時、ユーザー画像の拡張子を制限する
  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg', 'image/gif', 'image/bmp']
    errors.add(:image, 'の拡張子が間違っています') unless image.content_type.in?(extension)
  end

  # ユーザー画像が添付される時
  def was_attached?
    image.attached?
  end
end
