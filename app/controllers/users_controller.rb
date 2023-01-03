class UsersController < ApplicationController
	def update
		@user = User.find(current_user.id)
		@user.build_farm(farm_param).save
		@user.update(user_param)

	end

	private

	def user_param
		params.require(:user).permit(:first_name, :last_name, :phone_number,:city, :address, :landline)
	end

	def farm_param
		params.require(:farm).permit(:farm_name, :year_of_establish, :village_name, :farm_address, :bird_type, :category)
	end
end
