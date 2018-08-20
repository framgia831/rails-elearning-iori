class User < ApplicationRecord
	has_many :lessons

	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id"
	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"

	has_many :following, through: :active_relationships, source: :followed 
	has_many :followers, through: :passive_relationships

	has_many :lesson_words, through: :lessons

	before_save { self.email = email.downcase }
 	validates :name, presence: true, 
					 length:{ maximum: 50}
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 	validates :email, presence: true,
					  length:{ maximum: 255},
					  format:{with: VALID_EMAIL_REGEX},
					  uniqueness: {case_sensitive: false} 

 	has_secure_password 

 	def follow(other_user)
		following << other_user
		
	end

	def following?(other_user)
		following.include? other_user
		
	end

	def unfollow(other_user)
		following.delete(other_user)
		
	end
end
