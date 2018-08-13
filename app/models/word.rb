class Word < ApplicationRecord
  belongs_to :category
  has_many :words_answers, dependent: :destroy
  accepts_nested_attributes_for :words_answers

  validates :content, presence: true  

  validate :has_one_correct_answer

  def correct_answer
  	words_answers.each do |answer|
  		if answer.correct?
  			return answer.content
  		end
  	end 
  end

  private
	  def has_one_correct_answer
	   unless words_answers.collect { |i| i.correct? || nil  }.compact.count == 1
	      errors.add(:word_answers, "should have one correct answer")
	    end
	  end

  
end
