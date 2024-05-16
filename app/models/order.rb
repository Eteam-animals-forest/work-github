class Order < ApplicationRecord
  belongs_to :customer, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
end
