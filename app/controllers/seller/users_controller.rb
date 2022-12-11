module Seller
  class UsersController < BaseController
    def index
      @user = User.new
    end

    def form_wizard
      @user = User.find(current_user.id)
      
    end
	  
  end
end
