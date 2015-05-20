class FoodsController < ApplicationController

	before_action :authenticate


	def index
		@foods = Food.all
	end

	def show
		@food = Food.find(params[:id])
	end

	def new
		@food = Food.new
	end

	def update
		@food = Food.find(params[:id])
		
		results = Nutritionix.search(@food.name)
		
		@food.update(food_params)


		redirect_to food_path(@food)
	end

	def add_food(food)
		self.foods.push(food)
	end

	def add_info
		@food = Food.find(params[:id])	
		@results = Nutritionix.search(@food.name) 

		# redirect_to add_info_food_path
	 	# render :add_info_food
	   render json: @results
	end	
	
	def create
		@food = Food.new(food_params)
		@meal = Meal.find(food_params[:meal_id])
		@meal.foods << @food
		if @food.save!
			redirect_to @food
		else
			render :new
		end		
	end


	private
	def food_params
		params.require(:food).permit(:name, :calories, 
																:fat_calories, :carbohydrates,
																:fats, :protein, :meal_id)
	end
end