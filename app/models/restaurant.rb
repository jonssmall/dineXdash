class Restaurant < ActiveRecord::Base
	has_many :menu_items

	validates :name, :address, :description, :presence => true
end
