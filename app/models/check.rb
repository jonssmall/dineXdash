class Check < ActiveRecord::Base
	has_many :check_items
	belongs_to :user
	belongs_to :restaurant
	# user_id, :restaurant_id, :paid_at
	validates :user_id, :restaurant_id, :presence => true
end
