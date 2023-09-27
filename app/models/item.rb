class Item < ApplicationRecord
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_burden, class_name: 'DeliveryBurden'
  belongs_to :prefecture
  belongs_to :delivery_day, class_name: 'DeliveryDay'

  belongs_to :user
end
