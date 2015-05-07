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

	def create
		@food = Food.new(food_params)
		if @food.save
			redirect_to @food
		else
			render :new
		end		
	end

	private
	def food_params
		params.require(:food).permit(:name, :calories, 
																:fat_calories, :carbohydrates,
																:fats, :protein)
	end
end