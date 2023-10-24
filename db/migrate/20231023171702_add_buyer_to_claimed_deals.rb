class AddBuyerToClaimedDeals < ActiveRecord::Migration[6.0]
  def change
    add_reference :claimed_deals, :buyer, null: false, foreign_key: true
  end
end
