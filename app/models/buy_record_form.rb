class BuyRecordForm
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :area, :address, :build_name, :tel, :user_id, :item_id

  validates :post_code, presence: { message: "can't be blank" }, 
  format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }

  validates :prefecture_id, presence: { message: "can't be blank" }, 
  numericality: { other_than: 0, message: 'Select' }
  
  validates :area, presence: { message: "can't be blank" }
  validates :address, presence: { message: "can't be blank" }
  
  validates :tel, presence: { message: "can't be blank" }, 
  length: { minimum: 10, message: 'is too short' }, 
  format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
  
  validates :user_id, presence: true
  validates :item_id, presence: true

    def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      buy_record = BuyRecord.create!(user_id: user_id, item_id: item_id)
      DeliveryDestination.create!(post_code: post_code, prefecture_id: prefecture_id, area: area, address: address, build_name: build_name, tel: tel, buy_record_id: buy_record.id)
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end
