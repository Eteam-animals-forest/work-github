class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :item, dependent: :destroy
  
  enum making_status: { not_started: 0, awaiting_manufacture: 1, under_manufacture: 2, completion_of_manufacturing: 3 }
  
end
