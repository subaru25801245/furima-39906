class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_burden, class_name: 'DeliveryBurden'
  belongs_to :prefecture
  belongs_to :delivery_day, class_name: 'DeliveryDay'

  has_one_attached :image

  belongs_to :user

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }




end
