module Seller
  class UsersController < BaseController
    def index
      @user = User.new
    end
	  
  end
end
