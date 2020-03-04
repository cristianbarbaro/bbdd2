class ProblemsController < ApplicationController
  before_action :authorized_admin
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  # GET /problems
  def index
    @problems = Problem.all
  end

  # GET /problems/1
  def show
  end

  # GET /problems/new
  def new
    @problem = Problem.new
  end

  # GET /problems/1/edit
  def edit
  end

  # POST /problems
  def create
    @problem = Problem.new(problem_params)

    if @problem.save
      flash[:success] = 'Problem was successfully created.'
      redirect_to @problem
    else
      render :new
    end
  end

  # PATCH/PUT /problems/1
  def update
    if @problem.update(problem_params)
      flash[:success] = 'Problem was successfully updated.'
      redirect_to @problem
    else
      render :edit
    end
  end

  # DELETE /problems/1
  def destroy
    if @problem.plot_problems.length > 0
      flash[:danger] = 'Problem could not be destroyed. Has crops associated.'
      redirect_to @problem
      return
    end
      @problem.destroy
      flash[:success] = 'Problem was successfully destroyed.'
      redirect_to problems_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def problem_params
      params.require(:problem).permit(:name, :scientific_name, :url, :description)
    end
end
