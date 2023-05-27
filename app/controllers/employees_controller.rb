class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :authenticate_employee!
  before_action :admin_only, only: %i[ edit update new create destroy confirm_password ]
  def confirm_password
    employee = Employee.find_by(id: params[:id])
    if current_employee.valid_password?(params[:password])
      # Password matches
      # Perform the desired action (e.g., delete employee)
      employee.destroy
      redirect_to employees_path, notice: "employee successfully deleted."
    else
      # Password doesn't match
      redirect_to employees_path, alert: "Incorrect password."
    end
  end

  # GET /employees or /employees.json
  def index
    @employees = Employee.all.order(:id)
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    params = employee_params
    if params[:current_password].present?
      if current_employee.valid_password?(params[:current_password])
        params.delete(:current_password)
        respond_to do |format|
          if @employee.update(params)
            format.html { redirect_to employees_path, notice: "Employee was successfully updated." }
            format.json { render :show, status: :ok, location: @employee }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to edit_employee_path(@employee), alert: "Password is incorrect"
      end
    else
      redirect_to edit_employee_path(@employee), alert: "Please enter your current password"
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :last_name, :admin, :shift, :status, :salary, :phone, :email, :password, :password_confirmation, :current_password)
    end
    def admin_only
      unless current_employee.admin?
        redirect_to employees_path, :alert => "Access denied."
      end
    end
end
