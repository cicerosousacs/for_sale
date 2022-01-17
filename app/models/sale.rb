class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :payment
  belongs_to :paystatus
end
