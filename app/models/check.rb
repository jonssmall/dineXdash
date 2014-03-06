class Check < ActiveRecord::Base
	has_many :check_items
	belongs_to :diner, class_name: 'User', foreign_key: :user_id
	belongs_to :restaurant
	# user_id, :restaurant_id, :paid_at
	validates :user_id, :restaurant_id, :presence => true

	scope :pending, -> { where(paid_at: nil) }

end
