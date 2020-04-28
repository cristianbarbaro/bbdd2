class ProductApplicationsController < ApplicationController
  before_action :set_farm
  before_action :set_plot
  before_action :set_product_application, only: [:show, :edit, :update, :destroy]

  # GET /farms/:farm_id/plots/:plot_id/product_applications
  def index
    @product_applications = @plot.product_applications
  end

  # GET /farms/:farm_id/plots/:plot_id/product_applications/:id
  def show
  end

  # GET /farms/:farm_id/plots/:plot_id/product_applications/new
  def new
    @product_application = @plot.product_applications.build
  end

  # GET /farms/:farm_id/plots/:plot_id/product_applications/:id/edit
  def edit
  end

  # POST /farms/:farm_id/plots/:plot_id/product_applications
  def create
    update_model @product_application, product_application_params, farm_plot_product_applications_path(@farm, @plot)
  end

  # PATCH/PUT /farms/:farm_id/plots/:plot_id/product_applications/:id
  def update
    if @product_application.update(product_application_params)
      flash[:success] = 'Product application was successfully updated.'
      redirect_to farm_plot_product_application_path(@farm, @plot)
    else
      render :edit
    end
  end

  # DELETE /farms/:farm_id/plots/:plot_id/product_applications/:id
  def destroy
    @product_application.destroy
    flash[:success] = 'Product application was successfully destroyed.'
    redirect_to farm_plot_product_applications_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_application
      @product_application = @plot.product_applications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_application_params
      params.require(:product_application).permit(:comment, :amount, :product_id, :lock_version)
    end
end
