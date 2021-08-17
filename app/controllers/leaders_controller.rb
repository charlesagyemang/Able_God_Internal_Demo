class LeadersController < ApplicationController
  before_action :set_leader, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /leaders or /leaders.json
  def index
    @leaders = Leader.all
    @leadership_report = LeadershipReport.new
    @outreach_report = OutreachReport.new
  end

  # GET /leaders/1 or /leaders/1.json
  def show
  end

  # GET /leaders/new
  def new
    @leader = Leader.new
  end

  # GET /leaders/1/edit
  def edit
  end

  # POST /leaders or /leaders.json
  def create
    @leader = Leader.new(leader_params)

    respond_to do |format|
      if @leader.save
        format.html { redirect_to departments_url, notice: "Leader was successfully created." }
        format.json { render :show, status: :created, location: @leader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaders/1 or /leaders/1.json
  def update
    respond_to do |format|
      if @leader.update(leader_params)
        format.html { redirect_to departments_url, notice: "Leader was successfully updated." }
        format.json { render :show, status: :ok, location: @leader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaders/1 or /leaders/1.json
  def destroy
    @leader.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: "Leader was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leader
      @leader = Leader.includes(:member, :department, :leadership_reports, :outreach_reports).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leader_params
      params.require(:leader).permit(:member_id, :department_id, :leader_type)
    end
end
