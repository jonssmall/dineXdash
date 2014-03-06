class MenuItem < ActiveRecord::Base
	belongs_to :restaurant

	validates :restaurant_id, :item_name, :item_desc, :price, :presence=> true
	validates :price, numericality: { :greater_than_or_equal_to => 1 }
end
