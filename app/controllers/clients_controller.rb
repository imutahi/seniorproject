class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  include Secured

  # NOTE
  # FIXME: Find a different way to keep track of admin (maybe via an admin table so the
  # current admin can add more on the view)

  # GET /clients or /clients.json
  def index
    @admin = "talontest7@gmail.com"
    if curr_user_is_admin? 
      @clients = Client.all
    else 
      @currentclient = Client.find_by(email: session[:userinfo][:info][:email])
    end
  end

  # GET /clients/1 or /clients/1.json
  def show
    @currentclient = Client.find_by(email: session[:userinfo][:info][:email])
    if curr_user_is_admin?
      render :show
    elsif !session[:userinfo].nil? && !@currentclient.nil? && session[:userinfo][:info][:email] == @currentclient.email
      @client = Client.find_by(email: session[:userinfo][:info][:email])
      render :show
    else
      redirect_to clients_path 
    end
  end

  # GET /clients/new
  def new
    @client = Client.new
    @admin = "talontest7@gmail.com"
  end

  # GET /clients/1/edit
  def edit
    @admin = "talontest7@gmail.com"
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
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
      # if the current user is not an admin and they try to change the status, it doesn't get processed
      if !curr_user_is_admin?
        params.require(:client).permit(:client_name, :status, :total_requests, :company, :email, :address, :city, :state, :zip, :phone, :fax, :notes, :client_id).delete_if do |key, val|
          key == "status"
        end
      else
        params.require(:client).permit(:client_name, :status, :total_requests, :company, :email, :address, :city, :state, :zip, :phone, :fax, :notes, :client_id)
      end
    end
end
