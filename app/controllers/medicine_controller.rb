class MedicineController < ApplicationController
    
    def index
    end
    
    def new
        #@medicine = Medicine.new(    :generic        => params[:generic], 
        #                             :brand          => params[:brand],
        #                             :price          => 0,
        #                             :quantity       => 0,
        #                             :mg             => params[:mg],
        #                             :medType        => params[:medType],
        #                            :classifcation => params[:classification]
        #
        @medicine = Medicine.new(   :generic => params[:generic_name],
                                    :brand => params[:brand_name],
                                    :price => params[:price],
                                    :quantity => params[:quantity],
                                    :mg => params[:mg],
                                    :medType => "",
                                    :classifcation => "")
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
#@medicine = Medicine.new(:generic => params[:generic_name],
#                                 :brand => params[:brand_name],
#                                 :price => params[:price],
#                                 :Quantity => params[:quantity],
#                                 :mg => params[:mg])
#        @medicine.save
#        redirect_to dashboard_url(email: params[:email])
