class UsersController < ApplicationController
	
	def update
		@user = User.find(current_user.id)
		@user.image.attach(params[:user][:image]) if params[:user][:image].present?
		if params[:user].present? && params[:farm].present?
			@user.build_farm(farm_param).save
			@user.update(user_param)
			redirect_to is_approved_account_seller_users_path
			flash[:info] = "Data has Been Saved!"
		else
			form_wizard_seller_users_path
			flash[:danger] = "Something is Missing"
		end



		

	end

	private

	def user_param
		params.require(:user).permit(:first_name, :last_name, :phone_number,:city, :address, :landline, :is_complete, :image)
	end

	def farm_param
		params.require(:farm).permit(:farm_name, :year_of_establish, :village_name, :farm_address, :bird_type, :category)
	end
end
