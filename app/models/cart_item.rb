class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
  validates :amount, presence: true
  
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
