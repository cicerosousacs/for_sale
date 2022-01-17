class Category < ApplicationRecord
    self.inheritance_column = :_type_disabled
    validates :type, presence: true
    has_many :products
    paginates_per 7
end
