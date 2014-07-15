class SessionsController < ApplicationController

	def new
		@user = User.new

	end

	def destroy
		session[:user_id] = nil
    redirect_to root_path

	end

	def create
		user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      user.valid?
      session[:user_id] = user.id
    end
    redirect_to root_path
	end


end