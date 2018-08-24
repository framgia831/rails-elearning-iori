class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :lesson_words, dependent: :destroy
  has_many :words, through: :lesson_words, dependent: :destroy
  has_many :words_answer, through: :lesson_words, dependent: :destroy

  has_many :activities, :as => :action, dependent: :destroy 

end
