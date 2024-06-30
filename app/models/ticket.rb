class Ticket < ApplicationRecord
  # 関連
  belongs_to :user, optional: true
  belongs_to :event

  # バリデーション
  validates :comment, length: { maximum: 30 }, allow_blank: true
end
