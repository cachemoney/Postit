class PostsController < ApplicationController
	before_filter :require_user, except: [:index, :show]
	before_filter :find_post, only: [:show, :update, :destroy]
	# before_filter :must_be_authenticated, only: [:new, :create]

  def index
  	@posts = Post.all
  end

  def show
  	# "build" creates an empty comments obj in memory that sets the post_id already for us
  	@comment = @post.comments.build
  end

  #get verb
  def new
  	@post = Post.new
  end

  # post verb
  def create
  	@post = Post.new(params[:post])
  	# @post.user = User.find(1) #TODO :Needs an elegant solution
    # Will be associate user_id to new post object @currect_user came from application_controller
    @post.user_id = @current_user.id

  	if @post.save
  		flash[:notice] = "Post created."
  		redirect_to posts_path
  	else
  		render 'new'
  	end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:id])
      flash[:notice] = "The post was updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def find_post
  	@post = Post.find(params[:id])
  end

  # def must_be_authenticated
  # 	if not_authenticated
  # 		flash[:error] = "You dont have permission"
  # 		redirect_to root_path
  #   end
  # end

end
