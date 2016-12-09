class DashboardController < ApplicationController
    
    def index
        @user = User.find_by(email: params[:email].downcase)
    end
end
