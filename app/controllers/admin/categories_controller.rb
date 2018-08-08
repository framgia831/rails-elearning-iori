class Admin::CategoriesController < ApplicationController

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


	private
		def category_params
			params.require(:category).permit(:title, :description)
		end
end
