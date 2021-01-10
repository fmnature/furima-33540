class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :day

  has_many         :items
  has_one_attached :image

  validates :image       , presence: true
  validates :title       , presence: true
  validates :text        , presence: true
  validates :price       , numericality: 
                           { 
                            greater_than_or_equal_to: 300, 
                            less_than_or_equal_to: 9999999,
                            message: '入力値が300~9999999の範囲外です'  
                           }
  validates :category_id , numericality: { other_than: 1 } 
  validates :state_id    , numericality: { other_than: 1 } 
  validates :burden_id   , numericality: { other_than: 1 } 
  validates :area_id     , numericality: { other_than: 1 } 
  validates :days_id     , numericality: { other_than: 1 } 
end
