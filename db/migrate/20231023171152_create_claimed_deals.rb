class CreateClaimedDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :claimed_deals do |t|

      t.timestamps
    end
  end
end
