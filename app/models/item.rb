class Item < ApplicationRecord
   
   has_many :cart_items, dependent: :destroy
   has_many :order_ditails, dependent: :destroy
   belongs_to :genre, dependent: :destroy
   
   has_one_attached :image
   validates :name, {presence: true}
   validates :introduction, {presence: true}
   validates :price, {presence: true}
  
end
