class DashboardController < ApplicationController
    
    def index
        @user = User.find_by(email: params[:email].downcase)
        @medicine = Medicine.all.order(updated_at: :asc)
    end
end
