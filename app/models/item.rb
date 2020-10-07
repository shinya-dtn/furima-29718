class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end
  with_options presence: true do
    validates :image
    validates :prodact_name
    validates :comment
    validates :money, format: { with: /\A[0-9]+\z/i }, numericality: { greater_than_or_equal_to: 300 }
  end
end
