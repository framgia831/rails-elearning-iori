class Admin::CategoriesController < ApplicationController
	before_action :require_login
	before_action :admin_user

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save 
			flash[:success] = "Successfully saved"  
			redirect_to new_admin_category_path
		else
			render 'new'

		end
	end

	def edit
		@category = Category.find(params[:id])
		
	end

	def update
		@category = Category.find(params[:id])

		if @category.update_attributes(category_params)
			flash[:success] = "Successfully updated" 
			redirect_to edit_admin_category_path(@category)
		else
			render 'edit'
			
		end
		
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
			flash[:success] = "Successfully all delete!"

		redirect_to admin_categories_path
	end


	private
		def category_params
			params.require(:category).permit(:title, :description)
		end

		def admin_user
			unless current_user.admin?
				flash[:info] = "You are not allowed to do that"
				redirect_to users_url
			end
			
		end
end
