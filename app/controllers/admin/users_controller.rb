module Admin
  class UsersController < BaseController
    def index
    	@users = User.all.where(role: 'seller')
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

    def view_profile
    	@user =  User.find(params[:id])    	
    end

    def create_admin
    	@user = User.new
    	
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
    

    def user_params
	    params.require(:user).permit(:email, :role)
	  end

	  
  end
end
