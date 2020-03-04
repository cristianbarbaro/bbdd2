class CropsController < ApplicationController
  before_action :set_farm
  before_action :set_plot
  before_action :set_crop, only: [:show, :edit, :update, :destroy]

  # GET /farms/:farm_id/plots/:plot_id/crops
  def index
    @crops = @plot.crops
  end

  # GET /farms/:farm_id/plots/:plot_id/crops/:id
  def show
  end

  # GET /farms/:farm_id/plots/:plot_id/crops/new
  def new
    @crop = @plot.crops.build
  end

  # GET /farms/:farm_id/plots/:plot_id/crops/:id/edit
  def edit
  end

  # POST /farms/:farm_id/plots/:plot_id/crops
  def create
    @crop = @plot.crops.build(crop_params)
    if @crop.save
      flash[:success] = 'Crop was successfully created.'
      redirect_to farm_plot_crops_path(@farm, @plot)
    else
      render :new
    end
  end

  # PATCH/PUT /farms/:farm_id/plots/:plot_id/crops/:id
  def update
    if @crop.update(crop_params)
      flash[:success] = 'Crop was successfully updated.'
      redirect_to farm_plot_crop_path(@farm, @plot)
    else
      render :edit
    end
  end

  # DELETE /farms/:farm_id/plots/:plot_id/crops/:id
  def destroy
    @crop.destroy
    flash[:success] = 'Crop was successfully destroyed.'
    redirect_to farm_plot_crops_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crop
      @crop = @plot.crops.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crop_params
      params.require(:crop).permit(:comment, :amount, :variety_id)
    end
end
