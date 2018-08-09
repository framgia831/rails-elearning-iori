class Admin::WordsController < ApplicationController
	def new
		@word = Word.new
	end

	def create
		category = Category.find(params[:category_id])
		@word = category.words.build(word_params)

		if @word.save 
			flash[:success] = "Successfully saved"  
			redirect_to new_admin_category_word_path
		else
			render 'new'
		end
	end
	


	private
		def word_params
			params.require(:word).permit(:content)
		end
end