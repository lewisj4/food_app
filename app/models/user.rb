class User < ActiveRecord::Base
	has_secure_password

	def add_meal
		self.meals.push(meal)
	end
end
