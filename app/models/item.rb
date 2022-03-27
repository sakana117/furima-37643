class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name,length: { maximum: 40 }
    validates :item_info,length: { maximum: 1000 }
    validates :item_price,numericality: { in: 300..9999999, message:"is out of setting range" },format: { with: /\A[0-9]+\z/,message:"is invalid. Input half-width characters" }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :sales_status
    belongs_to :shipping_fee_status
    belongs_to :prefecture
    belongs_to :scheduled_delivery
end
