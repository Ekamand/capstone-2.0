class FavoritesController < ApplicationController
	before_action :authenticate_user!

		def index
			 @posts = Post.all
			 @favorites = Favorite.all
			@favorited_posts = Favorite.where(user_id: current_user.id)
			if @favorited_posts.empty?
				flash[:danger] = "Your favoite list is empty."
				redirect_to "/index"
			end
		end

		def create 
			 # @existingfavorite = Favorite.where(post_id: params[:input_post_id], 
			 # 								   user_id: current_user.id,
				# 							   status:"favorited") 
			 # if @favorited_posts.any? 
			@favorite = Favorite.new(user_id: current_user.id,
									post_id: params[:input_post_id])
										

				if @favorite.save 
					#success
					# session[:user_id] = @user.id
					flash[:success] = "Post was added to your favorites successfully"
					 redirect_to "/posts/#{params[:input_post_id]}"
				else
					#failure
					flash[:warning] = "Post Is already in you favorites"
					  redirect_to "/posts/#{params[:input_post_id]}"
				end
		end
		

		# def update 
		# 	@favoite = Favorite.find_by(id: params[:id])
		# 	@favorite = Favorite.update(status: "Removed")
		# 	redirect_to "/index"
		# end

		def destroy 
			@favorite = Favorite.find_by(id: params[:id])
			@favorite.destroy
			redirect_to "/favorites"
		end

end
