class CartItem < ApplicationRecord
  
  belongs_to :item, dependent: :destroy
  belongs_to :customer, dependent: :destroy
  
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
