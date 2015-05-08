class UsersController < ApplicationController
	def index
		render json: User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def add_meal(meal)
		user = User.find(session[:current_user])
		meal = Meal.find(params[:id])

		user.add_meal(params[:id])

		redirect_to user_path(meal)
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to meals_path
		else
			render :new
		end		
	end


	private
	def user_params
		params.require(:user).permit(:full_name, :username, :password, :password_confirmation)
	end
end
