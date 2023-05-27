class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy confirm_password ]
  before_action :authenticate_employee!
  before_action :authenticate_admin!, only: %i[  destroy confirm_password ]
  def confirm_password

    if current_employee.valid_password?(params[:password])
      # Password matches
      # Perform the desired action (e.g., delete employee)
      @client.destroy
      redirect_to clients_path, notice: "Client successfully deleted."
    else
      # Password doesn't match
      redirect_to clients_path, alert: "Incorrect password."
    end
  end

  # GET /clients or /clients.json
  def index
    @clients = Client.all.order(:id)
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    params = client_params
    if params[:current_password].present?
      if current_employee.valid_password?(params[:current_password])
        params.delete(:current_password)
        respond_to do |format|
          if @client.update(params)
            format.html { redirect_to clients_path, notice: "Client was successfully updated." }
            format.json { render :show, status: :ok, location: @client }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @client.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to edit_client_path(@client), alert: "Password is incorrect"
      end
    else
      redirect_to edit_client_path(@client), alert: "Please enter your current password"
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:Name, :LastName, :birthDate, :email, :phone, :state, :city, :colony, :street, :houseNumber, :cp, 
        :puntos, :status, :current_password)
    end
    def admin_only
      unless current_employee.admin?
        redirect_to clients_path, :alert => "Access denied."
      end
    end
end
