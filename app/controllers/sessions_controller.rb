class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email])

		if  user && user.authenticate(params[:session][:password])
			log_in user
			flash[:success] = "Success"
			redirect_to dashboard_path
		else
			flash[:danger] = "Invaild information."
			render 'new'
		end
	end

	def destroy 
		log_out
		flash[:info] = "Logged out"
		redirect_to root_url		
	end
end
