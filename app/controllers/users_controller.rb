class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
	end
	def show
		@user = User.all
		@post = Post.all
		@follows = Following.all
		user_id = params[:id]
		@user = User.find_by(id: user_id)
	end

	def update
		
	end
		def edit
		user_id = params[:id]
		@user = User.find_by(id: user_id)
	end



	def create 
		@user = User.new(user_name: params[:input_user_name],first_name: params[:input_first_name],
						last_name: params[:input_last_name],
						email: params[:input_email],
						admin: false,
						password: params[:input_password], 
						password_confirmation: params[:input_password_conformation], 
						photo: params[:inpt_profile_img_url])

			
		if @user.save 
			#success
			session[:user_id] = @user.id
			flash[:success] = "Account Created Successfully. Now you can create and comment on remedies and recipies"
			redirect_to "/index"
		else
			#failure
			flash[:warning] = "invalid email or password. Please Try again!"
			redirect_to "/login"
		end


	end
	
end
