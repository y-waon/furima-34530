class DonationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :post_number, :area_id, :municipalities, :house_number, :building_name, :product_id, :phone_number, :token

  
  with_options presence: true do
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/}, length: { maximum: 11 }
    validates :user_id
    validates :product_id
    validates :token
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :area_id, numericality: {other_than: 1}


  def save
    buy = Buy.create(product_id: product_id, user_id: user_id)
    Address.create(post_number: post_number, area_id: area_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end