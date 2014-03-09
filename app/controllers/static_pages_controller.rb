class StaticPagesController < ApplicationController
	def home
		@restaurant = Restaurant.last
	end
end
