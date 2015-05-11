class UsersController < ApplicationController
	def index
		render json: User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(session[:current_user])
	end

	def add_meal
		@user = User.find(session[:current_user])
		@meal = Meal.find(params[:id])
		# binding.pry

		@user.meals << @meal

		redirect_to user_path(params[:id])
		
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

# def add_meal
	# 	@meal = Meal.find(params[:id])
	# 	@user = User.find(session[:current_user])

	# 	@user.meals << @meal

	# 	redirect_to meals_path
	# end
