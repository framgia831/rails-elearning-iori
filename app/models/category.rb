class Category < ApplicationRecord
	has_many :words

	validates :title, presence: true, 
					  length:{ maximum: 50}

	validates :description, presence: true, 
					 		length:{ maximum: 150}
end
