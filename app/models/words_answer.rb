class WordsAnswer < ApplicationRecord
  belongs_to :word
  has_many :lesson_words, dependent: :destroy

  validates :content, presence: true
  
end
