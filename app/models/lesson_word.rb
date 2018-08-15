class LessonWord < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
  belongs_to :words_answer
end
