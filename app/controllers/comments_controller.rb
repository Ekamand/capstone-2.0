class CommentsController < ApplicationController

	def create
		@post = Post.find_by(params[:post_id])
		@comment = Comment.new(comment_text: params[:input_post_comment], 
								post_id: params[:input_post_id])
		if @comment.save
				# flash[:success] = "Post created successfully!"
			redirect_to "posts/#{@post.id}"
		else
			# flash[:danger] = "item could not be created!"
			redirect_to "posts/#{@post.id}"
		end
	end

end
