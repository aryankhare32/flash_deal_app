class ClaimedDeal < ApplicationRecord
    belongs_to :deal
    belongs_to :buyer
    validates :deal_id, :buyer_id, presence: true
end
