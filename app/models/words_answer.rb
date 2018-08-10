class WordsAnswer < ApplicationRecord
  belongs_to :word

  validates :content, presence: true
  
end
