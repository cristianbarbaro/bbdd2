class SpeciesController < ApplicationController
  before_action :authorized_admin
  before_action :set_species, only: [:show, :edit, :update, :destroy]

  # GET /species
  def index
    @species = Species.all
  end

  # GET /species/1
  def show
  end

  # GET /species/new
  def new
    @species = Species.new
  end

  # GET /species/1/edit
  def edit
  end

  # POST /species
  def create
    @species = Species.new(species_params)

    if @species.save
      flash[:success] = 'Species was successfully created.'
      redirect_to @species
    else
      render :new
    end
  end

  # PATCH/PUT /species/1
  def update
    if @species.update(species_params)
      flash[:success] = 'Species was successfully updated.'
      redirect_to @species
    else
      render :edit
    end
  end

  # DELETE /species/1
  def destroy
    if @species.plantations.length > 0
      flash[:danger] = 'Species could not be destroyed. Has plantations associated.'
      redirect_to @species
      return
    end
    @species.destroy
    flash[:success] = 'Species was successfully destroyed.'
    redirect_to species_index_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species
      @species = Species.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def species_params
      params.require(:species).permit(:name)
    end
end
