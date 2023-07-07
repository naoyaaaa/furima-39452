class Kaimono
  include ActiveModel::Model
  attr_accessor  :postal_code, :region_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token ,:price

    with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Phone number should be 10 to 11 digits.' }
    validates :token
  end
  validates :region_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase_log = PurchaseLog.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,purchase_log_id: purchase_log.id)
  end

end