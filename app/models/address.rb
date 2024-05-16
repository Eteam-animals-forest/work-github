class Address < ApplicationRecord
  
  belongs_to :customers, dependent: :destroy
  
end
