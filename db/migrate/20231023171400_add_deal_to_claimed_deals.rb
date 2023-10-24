class AddDealToClaimedDeals < ActiveRecord::Migration[6.0]
  def change
    add_reference :claimed_deals, :deal, null: false, foreign_key: true
  end
end
