class FollowingsController < ApplicationController

	def index 
		@user = User.find_by(id: params[:id])
		@followings = Following.all
		end
end
