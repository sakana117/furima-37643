class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_price
    validates :image

    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
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
