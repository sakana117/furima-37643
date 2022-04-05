class AddressAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :addresses
    validates :building
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
    validates :order_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture


end