class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy confirm_password]
  before_action :authenticate_employee!
  before_action :admin_only, only: %i[ edit update new create destroy confirm_password ]
  def confirm_password
    params = supplier_params
    if current_employee.valid_password?(params[:current_password])
      # Password matches
      # Perform the desired action (e.g., delete employee)
      @supplier.destroy
      redirect_to suppliers_path, notice: "Supplier successfully deleted along with theirs products."
    else
      # Password doesn't match
      redirect_to suppliers_path, alert: "Incorrect password."
    end
  end

  # GET /suppliers or /suppliers.json
  def index
    @suppliers = Supplier.all.order(:id)
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to suppliers_path, notice: "Supplier was successfully created." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    params = supplier_params
    if params[:current_password].present?
      if current_employee.valid_password?(params[:current_password])
        params.delete(:current_password)
        respond_to do |format|
          if @supplier.update(params)
            format.html { redirect_to suppliers_path, notice: "Supplier was successfully updated." }
            format.json { render :show, status: :ok, location: @supplier }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @supplier.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to edit_supplier_path(@supplier), alert: "Password is incorrect"
      end
    else
      redirect_to edit_supplier_path(@supplier), alert: "Please enter your current password"
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    @supplier.destroy

    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: "Supplier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:name, :email, :phone, :arrive_date, :rfc, :current_password)
    end

    def admin_only
      unless current_employee.admin?
        redirect_to suppliers_path, :alert => "Access denied."
      end
    end
end
