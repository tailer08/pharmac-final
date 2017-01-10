class MedicineController < ApplicationController
    
    def index 
        @medicine = Medicine.search(params[:search]).all.order(params[:sort])
        #if(params[:search].nil?) then
       #     @medicine = Medicine.all.order(updated_at: :asc)
       # else
       #      @medicine = Medicine.search(params[:search])
       # end
        render 'medicine/index'
    end
    def new
        @medicine = Medicine.new(   :generic => params[:generic_name],
                                    :brand => params[:brand_name],
                                    :price => params[:price],
                                    :quantity => params[:quantity],
                                    :mg => params[:mg],
                                    :medType => "",
                                    :classification => "")
        @medicine.save
    respond_to do |format|
       if @medicine.save
         format.html { redirect_to dashboard_url(email:@user.email), notice: 'Medicine was successfully created.' }
         format.json { render :index, status: :created, location: @medicine }
       else
         format.html { redirect_to dashboard_url(email:@user.email) }
         format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
        redirect_to dashboard_url(email: params[:email])
    end
    def createMed
        @medicine = Medicine.new(    :generic        => params[:generic], 
                                     :brand          => params[:brand],
                                     :price          => 0,
                                     :quantity       => 0,
                                     :mg             => params[:mg],
                                     :medType        => params[:medType],
                                     :classification => params[:classification]
                                )
        @medicine.save
        redirect_to dashboard_url(email: params[:email])
    end
    
    def create
    end
    
    def update
    end
    
    def edit
        @medicine = Medicine.find(params[:id])
        render 'edit'
    end
    
    def show
        @medicine = Medicine.find(params[:id])
    end
end
#@medicine = Medicine.new(:generic => params[:generic_name],
#                                 :brand => params[:brand_name],
#                                 :price => params[:price],
#                                 :Quantity => params[:quantity],
#                                 :mg => params[:mg])
#        @medicine.save
#        redirect_to dashboard_url(email: params[:email])
