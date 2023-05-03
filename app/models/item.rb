class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :shipping_fee
  belongs_to :shipping_schedule
  belongs_to :prefecture
  belongs_to :user

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 }
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

end
