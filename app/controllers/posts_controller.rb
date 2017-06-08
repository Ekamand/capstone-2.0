class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show, :search]

	def feed
		@posts = []
		# 1. Grab the people current_user is following
		@following = current_user.following.all

		# 2. For each 'following', grab that user's posts
		@following.each do |following|
			# Get user from the following instance
			user = following.user

			# Grab the posts of the user, and put into our array
			user.posts.each do |post|
				@posts << post
			end
		end

		@posts.sort_by{ |post| post[:created_at] }.reverse
	end

	def post_map

		render 'posts_map'
	end

	def index
		@comments = Comment.all
		@posts = Post.all
	end

	def create 

		@post = Post.all
		@post = Post.new(title: params[:input_title],
							post_text: params[:input_text],
							ingredients: params[:input_ingredients],
							user_id: params[:user_id],
							origin: params[:input_origin],
							directions: params[:input_directions])


		if @post.save
		  		flash[:success] = "Post created successfully!"
		  	if params[:img_url]
					@image = Image.create(img_url: params[:img_url], post_id: @post.id)
			end
				# @country = Geocoder.coordinates(params[:input_origin])
			# @image = Image.new(img_url: params[:img_url], post)
		  		redirect_to "/posts/#{@post.id}"
		  	else
		  		flash[:danger] = "item could not be created!"
		  		render "new.html.erb"
	  	end
	 	 # post_id = params[:id]
	end

	def show
		@post = Post.all
		@comments = Comment.all
		@user = User.all
		# @order = @order.find_by(id:)
		post_id = params[:id]
		@post = Post.find_by(id: post_id)

		post_origin = @post.origin
		@latlng = Geocoder.coordinates(post_origin)

	end

	def new 
		@post = Post.new
		if !(current_user)
		redirect_to "/index"
		end
	end

	def edit	
		# if !(current_user)
		# redirect_to "/"
		# else
		post_id = params[:id]
		@post = Post.find_by(id: post_id)
		end

	# end

	def update
		post_id = params[:id]
		@post = Post.find_by(id: post_id)
		@image = Image.find_by(post_id: post_id)
		@post.update(title: params[:input_title],
							post_text: params[:input_text],
							ingredients: params[:input_ingredients],
							user_id: params[:user_id],
							origin: params[:input_origin],
							directions: params[:input_directions])
		# puts "*" *5 + " post updated"
		@image.update(img_url: params[:img_url])
		# puts "*" *5 + " image updated"
		if @post.save && @image.save
		  		flash[:success] = "Post updated successfully!"
		  		redirect_to "/posts/#{@post.id}"
		 	else
		  		flash[:danger] = "item could not be updated!"
		  		# render "new.html.erb"
		  		
		end
	end

	def destroy
			# WORKING CODE
		@post = Post.find_by(id: params[:id])
		@post.destroy

		flash[:danger] = "Post deleted successfully!"
		redirect_to "/index"
	end

	def search
		search_term = params[:search_term]
		@posts = Post.where("title ILIKE?", "%#{search_term}%")
		render :index
	end


	def region_show
		@posts = []
		@region = params[:name]
		@region_countries = Post.countries(@region.to_s)
		# puts @region
		# puts @region_countries
		@region_countries.each do |country|


			@country_posts = Post.where(origin: country)

			@country_posts.each do |post|
				@posts << post
			end
		# @contry = Post.where(region: '%#{@region.countries}')

		end
	end


end
