class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  scope :find_price, -> (price) { find_by_price(price) }
  scope :written_about, -> (theme) { where("name link ?", "%#{theme}%") }
end
