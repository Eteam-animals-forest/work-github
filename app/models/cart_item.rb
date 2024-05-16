class CartItem < ApplicationRecord
  
  belongs_to :item, dependent: :destroy
  belongs_to :customer, dependent: :destroy
  
end
