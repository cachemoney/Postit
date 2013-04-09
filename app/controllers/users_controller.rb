class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "You are registered and logged in"
			redirect_to root_path
		else
			@user.errors.delete(:password_digest)
			render :new
		end
	end

	def show
  	@user = User.find(params[:id])
  end

end