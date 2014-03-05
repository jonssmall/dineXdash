class Restaurant < ActiveRecord::Base
	has_many :menu_items
	has_many :checks
	has_many :users, through: :checks

	validates :name, :address, :description, :presence => true
end
