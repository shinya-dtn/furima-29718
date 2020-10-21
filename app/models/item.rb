class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  belongs_to :user
  has_many_attached :images
  has_one :order

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end
  with_options presence: true do
    validates :images
    validates :prodact_name
    validates :comment
    validates :money, format: { with: /\A[0-9]+\z/i }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
