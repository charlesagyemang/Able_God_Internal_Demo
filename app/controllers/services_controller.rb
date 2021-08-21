class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit update destroy ]

  # GET /services or /services.json
  def index
    @services = Service.order(date: :desc)
    @service = Service.new
    @programme = Programme.new
  end

  # GET /services/1 or /services/1.json
  def show
    @qrcode = RQRCode::QRCode.new(url_for(@service.lineup))
    @svg = @qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 8,
      standalone: true,
      use_path: true
    )
    @pulll = "ksksksksks"
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services or /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        #create line_up
        @lineup = Lineup.create(service: @service, mc: "MC")
        format.html { redirect_to services_url, notice: "Service was successfully created. #{@lineup.id}" }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to services_url, notice: "Service was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: "Service was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.includes(lineup: :programme).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:service_type, :date, :male_attendance, :female_attendance, 
        :number_of_new_comers, :offertory_amount, :tithe_amount, :starting_time, :closing_time, :leader_id)
    end

    def lineup_params 
      params.require(:lineup).permit(:service_id, :mc)
    end
end
