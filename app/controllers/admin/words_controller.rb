class Admin::WordsController < ApplicationController
	def new
		@category = Category.find(params[:category_id])
		@word = @category.words.build
		3.times { @word.words_answers.build }
	end

	def create
		@category = Category.find(params[:category_id])
		@word = @category.words.build(word_params)

		if @word.save 
			flash[:success] = "Successfully saved"  
			redirect_to new_admin_category_word_path
		else
			render 'new'
		end
	end

	def index
		@category = Category.find(params[:category_id])
		@word = @category.words

		
	end

	def edit
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])

	end

	def update
		@word = Word.find(params[:id])

		if @word.update_attributes(word_params)
			flash[:success] = "Successfully updated" 
			redirect_to admin_category_words_path
		else
			render 'edit'
			
		end
	end

	def destroy
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
		@word.destroy
			flash[:success] = "Successfully all delete!"

		redirect_to admin_category_words_path(@category)
		
	end
	


	private
		def word_params
			params.require(:word).permit(:content, words_answers_attributes: [:id,:content,:correct])
		end
end