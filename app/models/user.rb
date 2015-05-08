class User < ActiveRecord::Base
	has_secure_password

	has_many :meals

	def add_meal(meal)
	end
end
