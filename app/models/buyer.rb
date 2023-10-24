class Buyer < ApplicationRecord
    has_many :claimed_deals
    validates :name, :email, presence: true
end
