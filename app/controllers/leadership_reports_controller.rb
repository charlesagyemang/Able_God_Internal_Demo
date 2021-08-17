class LeadershipReportsController < ApplicationController
  before_action :set_leadership_report, only: %i[ show edit update destroy ]

  # GET /leadership_reports or /leadership_reports.json
  def index
    @leadership_reports = LeadershipReport.all
  end

  # GET /leadership_reports/1 or /leadership_reports/1.json
  def show
  end

  # GET /leadership_reports/new
  def new
    @leadership_report = LeadershipReport.new
  end

  # GET /leadership_reports/1/edit
  def edit
  end

  # POST /leadership_reports or /leadership_reports.json
  def create
    @leadership_report = LeadershipReport.new(leadership_report_params)

    respond_to do |format|
      if @leadership_report.save
        format.html { redirect_to @leadership_report, notice: "Leadership report was successfully created." }
        format.json { render :show, status: :created, location: @leadership_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leadership_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leadership_reports/1 or /leadership_reports/1.json
  def update
    respond_to do |format|
      if @leadership_report.update(leadership_report_params)
        format.html { redirect_to @leadership_report, notice: "Leadership report was successfully updated." }
        format.json { render :show, status: :ok, location: @leadership_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leadership_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leadership_reports/1 or /leadership_reports/1.json
  def destroy
    @leadership_report.destroy
    respond_to do |format|
      format.html { redirect_to leadership_reports_url, notice: "Leadership report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leadership_report
      @leadership_report = LeadershipReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leadership_report_params
      params.require(:leadership_report).permit(:references, :how_many_minutes_prayed, :how_many_chapters_read, :how_many_messages_soaked, :how_many_times_fasted_in_a_week, :current_book_you_are_reading, :summary)
    end
end
