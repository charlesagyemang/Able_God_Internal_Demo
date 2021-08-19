class LineupsController < ApplicationController
  before_action :set_lineup, only: %i[ show edit update destroy ]

  # GET /lineups or /lineups.json
  def index
    @lineups = Lineup.all
  end

  # GET /lineups/1 or /lineups/1.json
  def show
  end

  # GET /lineups/new
  def new
    @lineup = Lineup.new
  end

  # GET /lineups/1/edit
  def edit
  end

  # POST /lineups or /lineups.json
  def create
    @lineup = Lineup.new(lineup_params)

    respond_to do |format|
      if @lineup.save
        format.html { redirect_to lineups_url, notice: "Lineup was successfully created." }
        format.json { render :show, status: :created, location: @lineup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lineup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lineups/1 or /lineups/1.json
  def update
    respond_to do |format|
      if @lineup.update(lineup_params)
        format.html { redirect_to services_url, notice: "Lineup was successfully updated." }
        format.json { render :show, status: :ok, location: @lineup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lineup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lineups/1 or /lineups/1.json
  def destroy
    @lineup.destroy
    respond_to do |format|
      format.html { redirect_to lineups_url, notice: "Lineup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lineup
      @lineup = Lineup.includes(:programmes, :service).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lineup_params
      params.require(:lineup).permit(:service_id, :mc)
    end
end
