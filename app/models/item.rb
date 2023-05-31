class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :shipping_fee
  belongs_to :shipping_schedule
  belongs_to :prefecture
  belongs_to :user

  has_many_attached :images
  has_one :order
  has_many :comments, dependent: :destroy

  validates :images, :item_name, :price, :description, :condition, :category_id,
            :shipping_fee_id, :shipping_schedule_id, :prefecture_id, presence: true
  validates :condition_id, :category_id, :shipping_fee_id, :shipping_schedule_id, :prefecture_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :images, length: { minimum: 1, maximum: 5 }
end
