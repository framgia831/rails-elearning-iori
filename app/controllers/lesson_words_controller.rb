class LessonWordsController < ApplicationController
	def new
		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category 
		@word = (@category.words - @lesson.words).first
		@content = @word.words_answers

	end

	def create
		lesson = Lesson.find(params[:lesson_id])
		@lessonwords = lesson.lesson_words.build(word_id: params[:word_id], words_answer_id: params[:words_answer_id])

		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category
		@word1 = @category.words
		@word2 = @lesson.words

		if @lessonwords.save
			flash[:success] = "Successfully saved your answer" 
			@next = @word1 - @word2

			if @next.any?
				redirect_to new_lesson_lesson_word_path(@lesson)
			else
				redirect_to lesson_lesson_words_path
			end
		end

	end

	def index
		@lesson = Lesson.find(params[:lesson_id])
		@lesson.lesson_words
	end

end



