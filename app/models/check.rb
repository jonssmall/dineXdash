class Check < ActiveRecord::Base
	has_many :check_items, dependent: :destroy
	belongs_to :diner, class_name: 'User', foreign_key: :user_id
	belongs_to :restaurant
	# user_id, :restaurant_id, :paid_at
	validates :user_id, :restaurant_id, :presence => true
	before_save :set_tip

	scope :pending, -> { where(paid_at: nil) }
	scope :closed, -> { where.not(paid_at: nil) }

	def subtotal
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

	     #  tip_amount = subtotal * (@check.tip/ 100.0)
      # tax_amount = subtotal * 0.14

      # @check.total = subtotal + tip_amount + tax_amount

	def tip_amount
		tip_amount = subtotal * tip/100.0
	end

	def tax_amount
		tax_amount = subtotal * 0.14
	end

	def total
		total = subtotal + tip_amount + tax_amount
	end

	def set_tip
		tip = diner.tip
	end


end
