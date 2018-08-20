class WordsController < ApplicationController
	def index
		@lesson = current_user.lessons
		@lessonword = current_user.lesson_words
	end
end
