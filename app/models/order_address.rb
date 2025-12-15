class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :token,
                :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :token

  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id
  validates :city
  validates :address_line
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
end

validates :prefecture_id,
          numericality: { other_than: 1, message: "can't be blank" },
          allow_blank: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address_line: address_line,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end