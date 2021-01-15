class OrderForm
  include ActiveModel::Model
  attr_accessor :post_num, :area_id, :municipal, :address, :build_name, :phone_num, :buyer_id, :token, :item_id

  with_options presence: true do
    validates :post_num,    format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id
    validates :municipal
    validates :address
    validates :phone_num,   format: { with: /\A\d{10,11}\z/ }
    validates :token
  end
  validates :area_id,  numericality: { other_than: 1 }

  def save 
    order = Order.create(user_id: buyer_id, item_id: item_id)
    Info.create(post_num: post_num, area_id: area_id, municipal: municipal, address: address, build_name: build_name, phone_num: phone_num, order_id: order.id)
  end
end