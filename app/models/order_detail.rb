class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :item, dependent: :destroy
  
  def amount_total
    Orderdetail.sum(:amount)
  end 
end
