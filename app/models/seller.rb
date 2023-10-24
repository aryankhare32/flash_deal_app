class Seller < ApplicationRecord
    has_many :deals
    validates :name, :email, presence: true
    
end
