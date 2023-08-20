class OrderShippinginfo

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id,:item_id
  attr_accessor :token

  with_options presence: true do
    validates :token

    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" , allow_blank: true }

    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

    validates :city
    validates :address

    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number" , allow_blank: true },
                            length: { minimum: 10, maximum: 11 , allow_blank: true }

    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shippinginfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end