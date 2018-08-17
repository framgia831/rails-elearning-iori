class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]
	before_action :require_login, except: [:new, :create]
	before_action :admin_user, only: :destroy


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save 
			flash[:success] = "Successfully saved"  
			redirect_to root_path
		else
			render 'new'

		end
	end

	def show
		if logged_in?
			session[:user_id]
			@user = User.find(params[:id])
			
		else
			flash[:danger] = "You can't access that page"
			redirect_to root_url
		end
	end

	def edit
		@user = User.find(params[:id])
		
	end

	def update 
		@user = current_user

		if @user.update_attributes(user_params)
		 	flash[:success] = "Successfully updated" 
		 	redirect_to edit_user_url(@user)

		else
			render 'edit'

		end
	end

	def index
		@users = User.paginate(page: params[:page], per_page: 10)
	end

	def followers
		@user = User.find(params[:id])
		@title = "Followers"
		@users = @user.followers
		render 'show_follow'
	end


	def following
		@user = User.find(params[:id])
		@title = "Following"
		@users = @user.following
		render 'show_follow'
	end


	private 
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def correct_user
			user = User.find(params[:id])
			unless current_user == user
				flash[:danger] = "Error."
				redirect_to root_url
				
			end
		end

		def admin_user
			unless current_user.admin?
				flash[:info] = "You are not allowed to do that"
				redirect_to users_url
			end
			
		end
end
