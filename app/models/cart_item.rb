class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
  validates :amount, presence: true
  
  validates :amount, presence: true, numericality: { greater_than: 0 }
  
  def subtotal
    item.with_tax_price * amount
  end
  
  def with_tax_price
    (price * 1.1).floor
  end
  
end
