class PlantationsController < ApplicationController
  before_action :set_farm
  before_action :set_plot
  before_action :set_plantation, only: [:show, :edit, :update, :destroy]

  # GET /farms/:farm_id/plots/:plot_id/plantations
  def index
    @plantations = @plot.plantations
  end

  # GET /farms/:farm_id/plots/:plot_id/plantations/1
  def show
  end

  # GET /farms/:farm_id/plots/:plot_id/plantations/new
  def new
    @plantation = @plot.plantations.build
  end

  # GET /farms/:farm_id/plots/:plot_id/plantations/:id/edit
  def edit
  end

  # POST /farms/:farm_id/plots/:plot_id/plantations
  def create
    @plantation = @plot.plantations.build(plantation_params)
    if @plantation.save
      flash[:success] = 'Plantation was successfully created.'
      redirect_to farm_plot_plantations_path(@farm, @plot)
    else
      render :new
    end
  end

  # PATCH/PUT /farms/:farm_id/plots/:plot_id/plantations/:id
  def update
    if @plantation.update(plantation_params)
      flash[:success] = 'Plantation was successfully updated.'
      redirect_to farm_plot_plantation_path(@farm, @plot)
    else
      render :edit
    end
  end

  # DELETE /farms/:farm_id/plots/:plot_id/plantations/1
  def destroy
    @plantation.destroy
    flash[:success] = 'Plantation was successfully destroyed.'
    redirect_to farm_plot_plantations_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plantation
      @plantation = Plantation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plantation_params
      params.require(:plantation).permit(:comment, :amount, :species_id)
    end
end
