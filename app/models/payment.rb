class Payment < ApplicationRecord
    self.inheritance_column = :_type_disabled
    validates :type, presence: true
end
