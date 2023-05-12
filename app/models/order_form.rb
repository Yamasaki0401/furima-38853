class OrderForm
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :post_code, :prefecture_id, :city, :address,
                :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validate :building_name

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id,
                   city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
