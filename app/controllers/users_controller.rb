class UsersController < ApplicationController
	def index
		render json: User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			render :new
		end		
	end

	def add_meal
		user = User.find(session[:current_user])
		meal = Meal.find(params[:meal_id])

		user.add_meal(meal)
		redirect_to(meal_path(meal))
	end

	private
	def user_params
		params.require(:user).permit(:full_name, :username, :password, :password_confirmation)
	end
end
