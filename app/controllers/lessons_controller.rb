class LessonsController < ApplicationController
	before_action :require_login

	def new
		@lesson = Lesson.new
	end

	def create
		@lesson = current_user.lessons.build(lesson_params)
		
		if @lesson.save
			# flash[:success] = "Successfully saved"  
			redirect_to new_lesson_lesson_word_path(@lesson)
		else
			root_path
		end
	end


	private 
		def lesson_params
			params.require(:lesson).permit(:user_id, :category_id)
		end




end
