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
		@current_user = session[:current_user]
		@meal.save

		current_user.meals << @meal
		if current_user.add_meal(params[:meal])
			redirect_to meals_path	
		else
			render :new
		end		
	end


	private
	def meal_params
		params.require(:meal).permit(:name)
	end	
end	