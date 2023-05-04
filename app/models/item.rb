class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :shipping_fee
  belongs_to :shipping_schedule
  belongs_to :prefecture
  belongs_to :user

  has_one_attached :image

  validates :image, :item_name, :price, :description, :condition, :category_id,
            :shipping_fee_id, :shipping_schedule_id, :prefecture_id, presence: true
  validates :condition_id, :category_id, :shipping_fee_id, :shipping_schedule_id, :prefecture_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
end
