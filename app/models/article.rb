class Article < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }

  paginates_per 2

  scope :order_by_date, ->(type = :desc) { order(created_at: type) }
  scope :without_highlights, ->(ids) { where("id NOT in (#{ids})") if ids.present? }
end
