class Food < ActiveRecord::Base
	has_and_belongs_to_many :meals

	#API CALLS HERE
end
