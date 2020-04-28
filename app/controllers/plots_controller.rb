class PlotsController < ApplicationController
  before_action :set_farm
  before_action :set_plot, only: [:show, :edit, :update, :destroy]

  # GET /farms/:farm_id/plots
  def index
    @plots = @farm.plots
  end

  # GET /plots/1
  def show
  end

  # GET /farms/:farm_id/plots/new
  def new
    @plot = @farm.plots.build
  end

  # GET /farms/:farm_id/plots/:id
  def edit
  end

  # POST /farms/:farm_id/plots
  def create
    @plot = @farm.plots.build(plot_params)

    if @plot.save
      flash[:success] = 'Plot was successfully created.'
      redirect_to farm_plots_path(@farm)
    else
      render :new
    end
  end

  # PATCH/PUT /farms/:farm_id/plots/1
  def update
    update_model @plot, plot_params, farm_plot_path(@farm)
  end

  # DELETE /farms/:farm_id/plots/1
  def destroy
    @plot.destroy
    flash[:success] = 'Plot was successfully destroyed.'
    redirect_to farm_plots_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plot
      @plot = @farm.plots.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plot_params
      params.require(:plot).permit(:identifier, :description, :surface, :greenhouse, :lock_version)
    end
end