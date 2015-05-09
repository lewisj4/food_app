class MealsController < ApplicationController

	before_action :authenticate

	def index
		@meals = Meal.all
	end

	def show
		@meal = Meal.find(params[:id])
	end

	def new
		@meal = Meal.new
	end

	def add_meal(meal)
		self.meals.push(meal)
	end

	def create
		@meal = Meal.new(meal_params)
		#binding.pry gets hit here
		@current_user = session[:current_user]
		@meal.save

		current_user.meals << @meal
		if current_user.add_meal(params[:meal])
        	#binding.pry doesn't get hit here
        	redirect_to add_meal_user_path
		else
			render :new
		end		
	end


	private
	def meal_params
		params.require(:meal).permit(:name)
	end	
end	