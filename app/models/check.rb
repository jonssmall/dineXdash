class Check < ActiveRecord::Base
	has_many :check_items, dependent: :destroy
	belongs_to :diner, class_name: 'User', foreign_key: :user_id
	belongs_to :restaurant
	# user_id, :restaurant_id, :paid_at
	validates :user_id, :restaurant_id, :presence => true

	scope :pending, -> { where(paid_at: nil) }

	def total
		total = 0
		# check_items.each do |item|
	 # 		total += item.subtotal
		# end
		# return total
	end

end
