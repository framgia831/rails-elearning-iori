class Admin::WordsController < ApplicationController
	def new
		@category = Category.find(params[:category_id])
		@word = @category.words.build
		3.times { @word.words_answers.build }
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
			params.require(:word).permit(words_answers_attributes: [:word_id,:content,:correct])
		end
end