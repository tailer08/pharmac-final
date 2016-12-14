class MedicineController < ApplicationController
    
    def index
    end
    
    def new
        @medicine = Medicine.new(:generic => params[:generic_name],
                                 :brand => params[:brand_name],
                                 :price => params[:price],
                                 :Quantity => params[:quantity],
                                 :mg => params[:mg])
        @medicine.save
        redirect_to dashboard_url(email: params[:email])
    end
    
    def create
    end
    
    def update
    end
    
    def edit
    end
    
    def show
    end
end
