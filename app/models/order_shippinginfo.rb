class OrderShippinginfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id

  validates :city, :address, presence: true

  validates :prefecture_id, presence: true,
  numericality: { other_than: 1, message: "can't be blank" }


  validates :postal_code, presence: true,
            format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" , allow_blank: true }

  validates :phone_number, presence: true,
            format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number" , allow_blank: true },
            length: { minimum: 10, maximum: 11 , allow_blank: true }
            
            
  def save
    order = Order.create(item_id:item_id, user_id: user_id)
    Shippinginfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end