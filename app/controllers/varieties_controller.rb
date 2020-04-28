class VarietiesController < ApplicationController
  before_action :authorized_admin
  before_action :set_variety, only: [:show, :edit, :update, :destroy]

  # GET /varieties
  def index
    @varieties = Variety.all
  end

  # GET /varieties/1
  def show
  end

  # GET /varieties/new
  def new
    @variety = Variety.new
  end

  # GET /varieties/1/edit
  def edit
  end

  # POST /varieties
  def create
    @variety = Variety.new(variety_params)

    if @variety.save
      flash[:success] = 'Variety was successfully created.'
      redirect_to @variety
    else
      render :new
    end
  end

  # PATCH/PUT /varieties/1
  def update
    update_model @variety, variety_params, @variety
  end

  # DELETE /varieties/1
  def destroy
    if @variety.crops.length > 0
      flash[:danger] = 'Variety could not be destroyed. Has crops associated.'
      redirect_to @variety
      return
    end
    @variety.destroy
    flash[:success] = 'Variety was successfully destroyed.'
    redirect_to varieties_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variety
      @variety = Variety.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variety_params
      params.require(:variety).permit(:name, :scientific_name, :url, :description, :lock_version)
    end
end
