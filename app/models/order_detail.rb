class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :item, dependent: :destroy
  
  def subtotal_price
    Orderdetail.sum(:amount)
  end 
end
