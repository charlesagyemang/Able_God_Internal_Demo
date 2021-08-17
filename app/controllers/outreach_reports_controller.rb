class OutreachReportsController < ApplicationController
  before_action :set_outreach_report, only: %i[ show edit update destroy ]

  # GET /outreach_reports or /outreach_reports.json
  def index
    @outreach_reports = OutreachReport.all
  end

  # GET /outreach_reports/1 or /outreach_reports/1.json
  def show
  end

  # GET /outreach_reports/new
  def new
    @outreach_report = OutreachReport.new
  end

  # GET /outreach_reports/1/edit
  def edit
  end

  # POST /outreach_reports or /outreach_reports.json
  def create
    @outreach_report = OutreachReport.new(outreach_report_params)

    respond_to do |format|
      if @outreach_report.save
        format.html { redirect_to leaders_path, notice: "Outreach report was successfully created." }
        format.json { render :show, status: :created, location: @outreach_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outreach_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outreach_reports/1 or /outreach_reports/1.json
  def update
    respond_to do |format|
      if @outreach_report.update(outreach_report_params)
        format.html { redirect_to leaders_path, notice: "Outreach report was successfully updated." }
        format.json { render :show, status: :ok, location: @outreach_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outreach_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outreach_reports/1 or /outreach_reports/1.json
  def destroy
    @outreach_report.destroy
    respond_to do |format|
      format.html { redirect_to leaders_path, notice: "Outreach report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outreach_report
      @outreach_report = OutreachReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outreach_report_params
      params.require(:outreach_report).permit(
        :number_of_people_visited, :number_of_people_preached_to, 
        :number_of_people_prayed_for, :number_of_days_fasted, 
        :week_summary, :period_start, :period_end, :leader_id
      )
    end
end
