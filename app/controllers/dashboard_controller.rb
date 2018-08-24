class DashboardController < ApplicationController
	before_action :require_login
	
	def index
		user = current_user
		@activities = user.activities
	end

end
