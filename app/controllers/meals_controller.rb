class MealsController < ApplicationController

	before_action :authenticate

	def index
		@meals = Meal.all
	end

	def show
		@user = User.find(session[:current_user])
		@meal = Meal.find(params[:id])
		@food = Food.find(params[:id])
		@meal.user_id = current_user.id
	end

	def new
		@meal = Meal.new
	end

	def add_meal(meal)
		self.meals.push(meal)
	end

	def add_food
		@meal = Meal.find_by(params[:id])
		@food = Food.find(params[:id])
		#binding.pry

		@meal.foods << @food

		if @food.save!

			redirect_to meal_path(params[:id])
		else
			render @food
		end
	end

	def create
		@meal = Meal.new(meal_params)
		@user = User.find(session[:current_user])
		@meal.user_id = current_user.id

      @user.meals << @meal

    if @meal.save!
    	binding.pry
        redirect_to new_food_path
		else
			render :new
		end		
	end


	private
	def meal_params
		params.require(:meal).permit(:name)
	end	

	def user_only
		@user = User.find(session[:current_user])
		@meal = Meal.find(params[:id])
			(@meal.user_id == current_user.id) ? true : false
	end
end	