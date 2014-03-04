class Check < ActiveRecord::Base
	has_many :check_items
# user_id, :restaurant_id, :paid_at
validates :user_id, :restaurant_id, :presence => true
end
