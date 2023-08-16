class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :shipping_fee_id
  belongs_to :prefecture_id
  belongs_to :estimated_shipping_id

  validates :title, :price, :description, presence: true

  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :estimated_shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
end
