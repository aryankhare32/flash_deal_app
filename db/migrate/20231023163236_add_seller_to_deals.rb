class AddSellerToDeals < ActiveRecord::Migration[6.0]
  def change
    add_reference :deals, :seller, null: false, foreign_key: true
  end
end
