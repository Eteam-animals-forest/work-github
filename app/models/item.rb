class Item < ApplicationRecord
   
   has_many :cart_items, dependent: :destroy
   has_many :order_ditails, dependent: :destroy
   belongs_to :genre, dependent: :destroy
   
   has_one_attached :image
   validates :name, {presence: true}
   validates :introduction, {presence: true}
   validates :price, {presence: true}
   validates :genre, {presence: true}
   
   def get_image
      (image.attached?) ? image : 'no_image.jpg'
   end
   
   def with_tax_price
      tax_rate = 0.1
      price * (1 + tax_rate)
   end
  
end
