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

  validates :image, :name, :description, presence: true
  validates :price, presence: true,
                    # numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "must be between ¥300 to ¥9,999,999"},
                    format: { with: /\A[0-9]+\z/, message: "Price must be a half-width number" }

  validates :category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id,
              numericality: { other_than: 1 , message: "can't be blank" }

  def was_attached?
    self.image.attached?
  end
end
