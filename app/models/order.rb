class Order < ApplicationRecord
  belongs_to :customer, dependent: :destroy
  has_many :order_details, dependent: :destroy

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }

end
