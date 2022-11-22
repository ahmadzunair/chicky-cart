module Admin
  class DashboardController < BaseController
    def index
      @users = User.new
      # @users = User.all.where.not(role: 'admin')
    end
  end
end
