class Deal < ApplicationRecord
    belongs_to :seller
    has_many :claimed_deals
    validates :total_items, :price_per_item, :seller_id, :start_time, :end_time, :date_of_launch, :available_items, presence: true
    
    ## can have many validations, will be implemented if time is left
end
