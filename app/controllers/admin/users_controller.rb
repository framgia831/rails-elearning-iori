class Admin::UsersController < ApplicationController
	before_action :admin_user, only: :destroy
	def new
		
	end

	private
		def admin_user
			unless current_user.admin?
				flash[:info] = "You are not allowed to do that"
				redirect_to root_url
			end
			
		end
end
