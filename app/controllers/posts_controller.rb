class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show, :search]

	def index
		@comments = Comment.all
		@posts = Post.all

	end

	def create 

		@post = Post.all
		@post = Post.new(title: params[:input_title],
							post_text: params[:input_text],
							ingredients: params[:input_ingredients],
							user_id: params[:user_id])


		if @post.save
	  		flash[:success] = "Post created successfully!"
	  		puts "post saved **********"
	  		puts @post.id
		# @image = Image.create(img_url: params[:img_url], post_id: @post.id)
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
		# @order = @order.find_by(id:)
		post_id = params[:id]
		@post = Post.find_by(id: post_id)
	end

	def new 
		@post = Post.new
		if !(current_user)
		redirect_to "/index"
		end
	end

	def edit	
		if !(current_user)
		redirect_to "/"
		else
		post_id = params[:id]
		@post = Post.find_by(id: post_id)
		end

	end

	def update
		post_id = params[:id]
		@post = Post.find_by(id: post_id)
		@post.update(title: params[:input_title],
							post_text: params[:input_text],
							ingredients: params[:input_ingredients],
							user_id: params[:user_id])
		puts "*" *5 + " post updated"
		@image = Image.update(img_url: params[:img_url], post_id: post_id)
		puts "*" *5 + " image updated"
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


end
