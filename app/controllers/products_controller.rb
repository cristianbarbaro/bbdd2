class ProductsController < ApplicationController
  before_action :authorized_admin
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = 'Product was successfully created.'
      redirect_to @product
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    update_model @product, product_params, @product
  end

  # DELETE /products/1
  def destroy
    if @product.product_applications.length > 0
      flash[:danger] = 'Product could not be destroyed. Has products applications associated.'
      redirect_to @product
      return
    end
    @product.destroy
    flash[:success] = 'Product was successfully destroyed.'
    redirect_to products_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :composition, :description, :lock_version)
    end
end
