class Admin::UsersController < ApplicationController
	before_action :require_login
	before_action :admin_user
	
	private
		def admin_user
				unless current_user.admin?
					flash[:info] = "You are not allowed to do that"
					redirect_to users_url
				end
				
		end
end
