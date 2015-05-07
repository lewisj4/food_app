class Food < ActiveRecord::Base
	#API Calls in here??
	has_and_belongs_to_many :meals
end
