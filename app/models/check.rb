class Check < ActiveRecord::Base
	has_many :check_items, dependent: :destroy
	belongs_to :diner, class_name: 'User', foreign_key: :user_id
	belongs_to :restaurant
	# user_id, :restaurant_id, :paid_at
	validates :user_id, :restaurant_id, :presence => true
	before_save :set_tip

	scope :pending, -> { where(paid_at: nil) }
	scope :closed, -> { where.not(paid_at: nil) }

	def
		# test_array = []
		# self.check_items.where.not(id: nil).map do |item|
		# 	test_array << (item.price * item.quantity)
		# end
		# test_array.inject(:+)

		subtotal = 0
		self.check_items.where.not(id: nil).map do |item|
			subtotal += item.price * item.quantity
		end
		return subtotal


	end

	def subtotal
		# self.subtotal = 0
		# if self.check_items.any?
		# 	self.check_items.each do |item|
		#  		self.subtotal += item.price
		# 	end
		# end
		# return self.subtotal
	end

	def set_tip
		tip = diner.tip
	end


end
