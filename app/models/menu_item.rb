class MenuItem < ActiveRecord::Base
	belongs_to :restaurant

	validates :restaurant_id, :item_name, :item_desc, :price, :presence=> true
end
