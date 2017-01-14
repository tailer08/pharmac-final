class StocksController < ApplicationController
#  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end
  
  def new
  end

  # GET /stocks/new
  def addNew
    @medicine = Medicine.find(params[:medicine])
    @stock = @medicine.stocks.create(
                         # params.require(:stock).permit(:quantity, :price, :expiration_date)
                          :medicine_id => params[:medicine_id],
                          :quantity => params[:quantity],
                          :price    => params[:price]
                         # :expiration_date => params[:expiration_date]
                      )
    if @medicine.quantity == 0 
       @medicine.price = params[:price]
    end
    if @medicine.available == 0
      @medicine.available = @stock.quantity.to_i;
    elsif @medicine.price == @stock.price
      @medicine.available = @medicine.available + @stock.quantity.to_i
    end
      
    @medicine.quantity = @medicine.quantity.to_i + @stock.quantity.to_i
    @medicine.save
    if @stock.save
      flash[:success] = "Save Successful"
      @stock.save
    else
      flash[:error] = "Missing parameters"
    end
    redirect_to medicine_url
  end
  def subNew
    @medicine = Medicine.find(params[:medicine])
    @stock = @medicine.stocks
    if @medicine.available.to_i < params[:quantity].to_i
       flash[:error] = 'Invalid amount the price of medicine would be different'
      render 'create'
    end
    @var = params[:quantity]
    @stock.each do |item|
      if item.available.to_i <= @var.to_i && item.price == @medicine.price
        @medicine.available = @medicine.available.to_i - item.quantity.to_i
        @medicine.quantity = @medicine.quantity_to_i - item.quantity.to_i
        @var = @var.to_i - item.quantity.to_i
        if(@medicine.available==0 && !@stock[i+1].nil?) then
            @medicine.price = @stock[i+1].price
        elsif @medicine.available==0 && @stock[i+1].nil?
            @medicine.price = 0
        else
            @medicine.price = @medicine.price
        end
        item.destroy
        @medicine.save
      elsif @var.to_i < item.quantity.to_i  && item.price == @medicine.price
        @medicine.available = @medicine.available.to_i - @var.to_i
        @medicine.quantity = @medicine.quantity.to_i - @var.to_i
        item.quantity =  item.quantity.to_i - @var.to_i
        @var =0
        item.save
        @medicine.save
        break
      end
    end
    @medicine = Medicine.all.order(updated_at: :asc)
    redirect_to medicine_url
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:medId, :quantity, :price)
    end
end
