module Seller
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :seller?

    layout 'seller'

    private
    def seller?
      redirect_to root_path, alert: 'You are not authorized to access this page' unless current_user.seller?
    end
  end
end
