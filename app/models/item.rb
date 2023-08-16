class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :estimated_shipping

  validates :title, :description, presence: true

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,  allow_blank: true },
                    format: { with: /\A\d+\z/, allow_blank: true }

  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :estimated_shipping_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
end
