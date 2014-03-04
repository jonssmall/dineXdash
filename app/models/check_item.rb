class CheckItem < ActiveRecord::Base
	belongs_to :check
	validates :restaurant_id, :item_name, :item_desc, :price, :presence => true
	# restaurant_id, :item_name, :item_desc, :price
end
