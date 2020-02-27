class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  # GET /farms
  def index
    @farms = current_user.farms
  end

  # GET /farms/1
  def show
  end

  # GET /farms/new
  def new
    @farm = Farm.new
  end

  # GET /farms/1/edit
  def edit
  end

  # POST /farms
  def create
    @farm = Farm.create(farm_params)

    if @farm.save
      current_user.farms << @farm
      redirect_to @farm, notice: 'Farm was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farms/1
  def update
    if @farm.update(farm_params)
      redirect_to @farm, notice: 'Farm was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farms/1
  def destroy
    @farm.destroy
    redirect_to farms_url, notice: 'Farm was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm
      @farm = Farm.find(params[:id])
      head 403 unless current_user.farms.include?(@farm)
    end

    # Only allow a list of trusted parameters through.
    def farm_params
      params.require(:farm).permit(:name, :description, :address)
    end
end
