class FollowingsController < ApplicationController

	def index 
		@follows = Following.all
		end
end
