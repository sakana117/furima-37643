class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :item_price
    validates :user, foreign_key:true
    validates :image
  end

  has_one_attached :image
  belongs :user

end
