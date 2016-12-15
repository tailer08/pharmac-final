class DashboardController < ApplicationController
    
    def index
        @user = User.find_by_email(params[:email].to_s.downcase)
        @medicine = Medicine.where('quantity > 0')
        @medicine = @medicine.order(updated_at: :asc)
    end
    def brandSort
         @user = User.find_by_email(params[:email].to_s.downcase)
        @medicine = Medicine.all.order(:brand)
        render 'index'
    end
    def stockSort
        @user = User.find_by_email(params[:email].to_s.downcase)
        @medicine = Medicine.all.order(:Quantity)
        render 'index'
    end
    def priceSort
         @user = User.find_by_email(params[:email].to_s.downcase)
        @medicine = Medicine.all.order(:price)
        render 'index'
    end
    def createMedicine
        @user = User.find_by_email(params[:email].to_s.downcase)
        @medicine = Medicine.all.order(updated_at: :asc)
        render 'create'
    end
end
