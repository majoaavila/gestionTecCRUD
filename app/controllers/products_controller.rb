class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy confirm_password]
  before_action :authenticate_employee!
  def confirm_password
    params = product_params
    if current_employee.valid_password?(params[:current_password])
      # Password matches
      # Perform the desired action (e.g., delete employee)
      @product.destroy
      redirect_to products_path, notice: "Product successfully deleted."
    else
      # Password doesn't match
      redirect_to products_path, alert: "Incorrect password."
    end
  end

  # GET /products or /products.json
  def index
    @products = Product.all.order(:id)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    params = product_params
    if params[:current_password].present?
      if current_employee.valid_password?(params[:current_password])
        params.delete(:current_password)
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  else
    redirect_to edit_product_path(@product), alert: "Password is incorrect"
  end
else
  redirect_to edit_product_path(@product), alert: "Please enter your current password"
end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:bar_code, :name, :category, :batch, :exp_date, :buying_price, :selling_price, :units, :supplier_id, :current_password)
    end
end
