class User < ActiveRecord::Base
	has_secure_password

	validates :username, :full_name, presence: true

	has_many :meals

	def add_meal
		@user = User.find(session[:current_user])
		@meal = Meal.find(params[:id])
		# binding.pry

		@user.meals << @meal

		redirect_to user_path(params[:id])
		
	end
end
