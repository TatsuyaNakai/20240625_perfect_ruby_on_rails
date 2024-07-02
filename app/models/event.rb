class Event < ApplicationRecord
  # 関連
  belongs_to :owner, optional: true, class_name: 'User', foreign_key: 'owner_id'
  has_many :tickets, dependent: :destroy
  has_one_attached :image, dependent: false

  # アクセサ
  attr_accessor :remove_image

  # フック
  before_save :remove_thumbnail_image, if: -> { remove_image }

  # バリデーション
  validates :name, length: { maximum: 50 },
                    presence: true
                    
  validates :place, length: { maximum: 100 },
                    presence: true

  validates :content, length: { maximum: 2_000 },
                      presence: true

  validates :started_at, presence: true

  validates :ended_at, presence: true

  validates :image, content_type: %i[png jpg jpeg],
                    size: { less_than_or_equal_to: 10.megabytes },
                    dimension: { width: { max: 2_000 }, height: { max: 2_000 } }

  validate :validate_started_at, if: -> { started_at && ended_at }

  # メソッド
  def created_by?(user)
    return false unless user

    owner_id == user.id
  end


  # メソッド(Private)
  private

  def validate_started_at
    return if started_at < ended_at

    errors.add(:started_at, 'は終了時間よりも前に設定してください')
  end

  def remove_thumbnail_image
    return unless ActiveRecord::Type::Boolean.new.cast(remove_image)
    self.image = nil
  end
end
