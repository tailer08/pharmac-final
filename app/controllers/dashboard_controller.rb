class DashboardController < ApplicationController
    
    def index
        @user = User.find_by_email(params[:email].to_s.downcase)
        @medicine = Medicine.where('quantity > 0').search(params[:search]).all.order(params[:sort])
        @medicine.each do |med|
            @stock=med.stocks
            @stock.each do |ex|
                if ex.expiration_date.nil?
                    med.isExpiring=false
                elsif ex.expiration_date < Date.today + 10.days
                    med.isExpiring = true
                end
            end
        end
        #@medicine = Medicine.where('quantity > 0').order(updated_at: :asc)
        #@medicine = Medicine.all.order(updated_at: :asc)
    end
end
