class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :day
  belongs_to :user
  
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :genre_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: '入力値が300~9999999の範囲外です' }
end
