class FirmsController < ApplicationController
  before_action :set_firm, only: %i[ show edit update destroy ]
  include Secured

  # GET /firms or /firms.json
  def index
    @services = Service.all
    #@user = session[:userinfo]

    @currentclient = Client.find_by(email: session[:userinfo][:info][:email])
    if @currentclient.nil? and !curr_user_is_admin?
      redirect_to clients_path, notice: "You must fill out the client application in order to create a new request."
    elsif curr_user_is_admin?
      @firms = Firm.all
    else
      @firms = Firm.where(client_id: @currentclient.id)
    end
  end

  # GET /firms/1 or /firms/1.json
  def show
  end

  # GET /firms/new
  def new
    @firm = Firm.new
  end

  # GET /firms/1/edit
  def edit
    @services = Service.all
  end

  # POST /firms or /firms.json
  def create
    @firm = Firm.new(firm_params)

    @currentclient = Client.find_by(email: session[:userinfo][:info][:email])
    @firm.client_id = @currentclient[:id]

    respond_to do |format|
      if @firm.save
        format.html { redirect_to @firm, notice: "Firm was successfully created." }
        format.json { render :show, status: :created, location: @firm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @firm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firms/1 or /firms/1.json
  def update
    respond_to do |format|
      if @firm.update(firm_params)
        format.html { redirect_to @firm, notice: "Firm was successfully updated." }
        format.json { render :show, status: :ok, location: @firm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @firm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firms/1 or /firms/1.json
  def destroy
    @firm.destroy
    respond_to do |format|
      format.html { redirect_to firms_url, notice: "Firm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firm
      @firm = Firm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def firm_params
      params.require(:firm).permit(:invoice_data, :first_name, :middle_name, :last_name, :maiden_name, :dob, :ssn, :dl_state, :dl_number, :notes, :client_request, :file, service_ids:[])
    end
end
