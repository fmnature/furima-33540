class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :info, foreign_key: :order_id, dependent: :destroy
end
