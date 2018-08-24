class WordsController < ApplicationController
	before_action :require_login

	def index
		@lesson = current_user.lessons
		@lessonword = current_user.lesson_words
	end

end
