class ApplicationController < ActionController::Base
	include SessionsHelper

	private
		def require_login
			unless logged_in?
				flash[:danger] = "Please Login."
				redirect_to root_url
				
			end
		end

		def admin_user
			unless current_user.admin?
				flash[:info] = "You are not allowed to do that"
				redirect_to root_url
			end
			
		end

end
