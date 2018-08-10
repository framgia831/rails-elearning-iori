class Word < ApplicationRecord
  belongs_to :category
  has_many :words_answers, dependent: :destroy
  accepts_nested_attributes_for :words_answers

  validates :content, presence: true

  
end
