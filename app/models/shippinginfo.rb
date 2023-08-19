class Shippinginfo < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id, presence: true,
  numericality: { other_than: 1, message: "can't be blank" }
end
