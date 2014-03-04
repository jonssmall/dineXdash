class Restaurant < ActiveRecord::Base
	has_many :menu_items

	validates :name, :address, :description, :user_id, :presence => true
end
