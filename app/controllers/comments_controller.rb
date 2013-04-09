class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(params[:comment])
		@comment.post_id = @post.id
		@comment.user =  current_user

		if @comment.save
			flash[:notice] = "Your Comment is saved"
			# we want the id of the post.
			redirect_to post_path(@post)
		else
			# this is in the post
			render 'posts/show'
		end
	end

	def vote
		@comment = Comment.find(params[:id]) #instance b/c used in template
		Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
		
		respond_to do |format|
			format.html do
				flash[:notice] = "Your Vote was counted"
				redirect_to :back
			end
			format.js
		end
	end

end