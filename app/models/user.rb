class User < ApplicationRecord
  # 関連
  has_many :events, foreign_key: 'owner_id', dependent: :nullify
  has_many :tickets, dependent: :nullify
  has_many :participating_events, through: :tickets, source: :event

  # フック
  before_destroy :check_all_events_finished, prepend: true

  # クラスメソッド
  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = nickname
      user.image_url = image_url
    end
  end

  # メソッド(Private)

  private

  def check_all_events_finished
    if self.events.where(ended_at: Time.zone.today.beginning_of_day..).present?
      errors.add(:base, '公開中の未終了イベントが存在します')
    end

    if self.participating_events.where(started_at: ..Time.zone.today.end_of_day, ended_at: Time.zone.now..).present?
      errors.add(:base, '未終了の参加イベントが存在します')
    end

    throw :abort unless errors.empty?
  end
end
