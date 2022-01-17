class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :payment
  belongs_to :paystatus

  has_many :addproducts, inverse_of: :sales, dependent: :destroy
  accepts_nested_attributes_for :addproducts, reject_if: :all_blank, allow_destroy: true
end
