module Admin
  class UsersController < BaseController
  	
    def index
    	@user = User.new
      # @users = User.all.where.not(role: 'admin')
    end

    
    def delete_user
    	@user = User.find(params[:id]).really_destroy!
    	redirect_to admin_users_path
    end

    def delete_blocked_user
    	User.restore(params[:id])
    	User.find(params[:id]).really_delete
    	redirect_to admin_users_path
    end


    def create_admin
    	@user = User.new
    end

    def check_profile
    	@user =  User.find(params[:id])    	
    end

    def destroy
    	@client.destroy
	    flash[:success] = 'User Profile has been deleted'
	    redirect_to admin_users_path
    end

    def view_block_user
    	@users = User.deleted
    end

	  def block
	  	User.find(params[:id]).destroy
	    redirect_to admin_users_path
	  end

	  def unblock
	  	User.restore(params[:id])
	    redirect_to view_block_user_admin_users_path
	  	
	  end

    private
    def load_user
	    @client = User.find(params[:id])
	  end

    def user_params
	    params.require(:user).permit(:email, :role)
	  end

	  def password_params
	    # NOTE: Using `strong_parameters` gem
	    params.require(:user).permit(:password, :password_confirmation)
	  end
  end
end
