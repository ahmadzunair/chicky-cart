module Admin
  class UsersController < BaseController
    def index
    	@users = User.all.where(role: 'seller').where(is_subscription: true)
    end

    
    def delete_user
    	@user = User.find(params[:id]).really_destroy!
    	redirect_to admin_users_path
      flash[:danger] = "User is Permanent Delete!"
    end

    def delete_blocked_user
    	User.restore(params[:id])
    	User.find(params[:id]).really_delete
    	redirect_to admin_users_path
      flash[:danger] = "User is Permanent Delete!"
    end

    def view_profile
    	@user =  User.find(params[:id])
      @farm = Farm.all.where(user_id: params[:id]).first	
    end

    def create_admin
    	@user = User.new    	
    end

    def send_mail_create_admin
    	@user = User.new(user_params)
    	@user.password = 'password'
    	@user.password_confirmation = 'password'
    	@user.save
    	NotifyUserMailer.create_admin(new_admin: @user).deliver_now
    end

    def view_block_user
    	@users = User.deleted
    end

	  def block
	  	User.find(params[:id]).destroy
	    redirect_to admin_users_path
      flash[:danger] = "User Has Been Blocked!"
	  end


    def manage_subscription
      @users = User.all.where(role: 'seller').where(is_subscription: false)
    end

    def verify_user
      @user = User.find(params[:id])
      @user.is_subscription = true
      @user.save
      redirect_to manage_subscription_admin_users_path
      flash[:danger] = "A New user Join Chicky Cart!"
    end

	  def unblock
	  	User.restore(params[:id])
	    redirect_to view_block_user_admin_users_path
	  	flash[:danger] = "User Has Been Unblocked!"
	  end

    private
    

    def user_params
	    params.require(:user).permit(:email, :role, :first_name, :last_name)
	  end

	  
  end
end
