class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
	end

	def create 
		@user = User.new(first_name: params[:input_first_name],
						last_name: params[:input_last_name],
						email: params[:input_email],
						admin: false,
						password: params[:input_password], 
						password_confirmation: params[:input_password_conformation])

			
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
