class CheckItem < ActiveRecord::Base
	belongs_to :check
	validates :item_name, :item_desc, :price, :presence => true
	# restaurant_id, :item_name, :item_desc, :price
	validates :quantity, numericality: { only_integer: true, :greater_than_or_equal_to => 1 }

	def subtotal
		price * quantity
	end
end
