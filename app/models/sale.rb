class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :payment
  belongs_to :paystatus

  paginates_per 7
  
  has_many :adproducts, inverse_of: :sale, dependent: :destroy
  accepts_nested_attributes_for :adproducts, reject_if: :all_blank, allow_destroy: true
end
