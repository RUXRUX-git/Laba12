class MersenneNumbersController < ApplicationController
  before_action :set_mersenne_number, only: [:show, :edit, :update, :destroy]

  # GET /mersenne_numbers
  # GET /mersenne_numbers.json
  def index
    @mersenne_numbers = MersenneNumber.all
  end

  # GET /mersenne_numbers/1
  # GET /mersenne_numbers/1.json
  def show
  end

  # GET /mersenne_numbers/new
  def new
    @mersenne_number = MersenneNumber.new
  end

  # GET /mersenne_numbers/1/edit
  def edit
  end

  # POST /mersenne_numbers
  # POST /mersenne_numbers.json
  def create
    @mersenne_number = MersenneNumber.new(mersenne_number_params)

    respond_to do |format|
      if @mersenne_number&.save
        format.html { redirect_to @mersenne_number, notice: 'Mersenne number was successfully created.' }
        format.json { render :show, status: :created, location: @mersenne_number }
      else
        format.html { render :new }
        format.json { render json: @error, status: :unprocessable_entity }
      end
    end
  end

  def update 
    respond_to do |format|
      if @mersenne_number.update(mersenne_number_params)
        format.html { redirect_to @mersenne_number, notice: 'Mersenne_number was successfully updated.' }
        format.json { render :show, status: :ok, location: @mersenne_number }
      else
        format.html { render :edit }
        format.json { render json: @mersenne_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mersenne_numbers/1
  # DELETE /mersenne_numbers/1.json
  def destroy
    @mersenne_number.destroy
    respond_to do |format|
      format.html { redirect_to mersenne_numbers_url, notice: 'Mersenne number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mersenne_number
      @mersenne_number = MersenneNumber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mersenne_number_params
      params.require(:mersenne_number).permit(:max_number)
    end
end
