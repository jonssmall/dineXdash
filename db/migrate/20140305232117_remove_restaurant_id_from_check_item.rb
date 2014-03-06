class RemoveRestaurantIdFromCheckItem < ActiveRecord::Migration
  def change
  	remove_column :check_items, :restaurant_id
  end
end
