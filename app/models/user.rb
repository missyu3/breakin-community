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
  validate :image_content_type, if: :was_attached?
  # was_attachedの時、ユーザー画像の拡張子を制限する
  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg', 'image/gif', 'image/bmp']
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end
  # ユーザー画像が添付される時
  def was_attached?
    self.image.attached?
  end

  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }, allow_blank: true

  validates :remark, length: { maximum: 200 } #自己紹介は200文字以内とする

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :dance_level
  validates :dance_level_id, numericality: { other_than: 1 } #ダンスレベルカテゴリーを選択しないと登録できない

  def self.guest
    find_or_create_by!(email: 'guestlogin@example.com') do |user|
      user.nickname = Faker::Name.name
      user.password = Faker::Internet.password(min_length: 6)
      user.remark =
        'ダンス歴は10年です。好きなダンサーは〇〇です。主に東京で活動しています。〇〇大会優勝, 埼玉で毎週火曜19:00~レッスンをやっています。興味がある方はメッセージください。ダンスだけでなく最近はDJやラップといったカルチャーにも興味があり、勉強しています。'
    end
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def followered_by?(user)
    active_relationships.find_by(follower_id: user.id).present?
  end
end
