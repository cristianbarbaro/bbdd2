class PlotProblemsController < ApplicationController
  before_action :set_farm
  before_action :set_plot
  before_action :set_plot_problem, only: [:show, :edit, :update, :destroy]

  # GET /farms/:farm_id/plots/:plot_id/plot_problems
  def index
    @plot_problems = @plot.plot_problems
  end

  # GET /farms/:farm_id/plots/:plot_id/plot_problems/:id
  def show
  end

  # GET /farms/:farm_id/plots/:plot_id/plot_problems/new
  def new
    @plot_problem = @plot.plot_problems.build
  end

  # GET /farms/:farm_id/plots/:plot_id/plot_problems/:id/edit
  def edit
  end

  # POST /farms/:farm_id/plots/:plot_id/plot_problems
  def create
    @plot_problem = @plot.plot_problems.build(plot_problem_params)
    if @plot_problem.save
      redirect_to farm_plot_plot_problems_path(@farm, @plot), notice: 'Problem was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farms/:farm_id/plots/:plot_id/plot_problems/:id
  def update
    if @plot_problem.update(plot_problem_params)
      redirect_to farm_plot_plot_problem_path(@farm, @plot), notice: 'Problem was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farms/:farm_id/plots/:plot_id/plot_problems/:id
  def destroy
    @plot_problem.destroy
    redirect_to farm_plot_plot_problems_path, notice: 'Problem was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plot_problem
      @plot_problem = @plot.plot_problems.find(params[:id])
    end

    def set_farm
      @farm = Farm.find(params[:farm_id])
    end

    def set_plot
      @plot = @farm.plots.find(params[:plot_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plot_problem_params
      params.require(:plot_problem).permit(:comment, :problem_id)
    end
end
