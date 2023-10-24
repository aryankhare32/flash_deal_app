class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.integer :total_items
      t.decimal :price_per_item
      t.time :start_time
      t.time :end_time
      t.date :date_of_launch
      t.integer :available_items
    
      t.timestamps
    end
  end
end
