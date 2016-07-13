class LoginsController < ApplicationController
	def new
		
	end

	def create
		email = params[:email]
		password = params[:password]

		chef = Chef.find_by_email(email)
		if chef && chef.authenticate(password)
			flash[:success] = "You are now logged in."
			redirect_to recipes_path

			session[:chef_id] = chef.id
		else
			flash[:danger] = 'Email or password is incorrect.'
			render 'new'
		end

	end

	def destroy
		session[:chef_id] = nil
		flash[:success] = 'You have logged out'
		redirect_to root_path
	end
end