class SessionsController < ApplicationController
	def new; end

	def create
  	  @user = User.find_by_email(params[:session][:email])
  	  if @user && @user.authenticate(params[:session][:password])
	    	session[:user_id] = @user.id
	   		redirect_to(root_url, format: :html)
  	  else
	    	redirect_to('/login', format: :html)
  	  end
	end

	def destroy
  	  session[:user_id] = nil
  	  redirect_to(root_url, format: :html)
	end
end
