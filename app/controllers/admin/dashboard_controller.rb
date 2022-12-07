module Admin
  class DashboardController < BaseController
    def index
      @users = User.all.where(role: 'seller')
    end
    
  end
end
