class Relationship < ApplicationRecord
	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"

	has_many :activities, :as => :action, dependent: :destroy 
	
end
