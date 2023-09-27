class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, :description, :image, presence: true
  validates :category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank" }
end
