class IncidencesTrackingsController < ApplicationController
  before_action :set_incidences_tracking, only: [:show, :edit, :update, :destroy]

  # GET /incidences_trackings
  # GET /incidences_trackings.json
  def index
    @incidences_trackings = IncidencesTracking.all
  end

  # GET /incidences_trackings/1
  # GET /incidences_trackings/1.json
  def show
  end

  # GET /incidences_trackings/new
  def new
    @incidences_tracking = IncidencesTracking.new
  end

  # GET /incidences_trackings/1/edit
  def edit
  end

  # POST /incidences_trackings
  # POST /incidences_trackings.json
  def create
    @incidences_tracking = IncidencesTracking.new(incidences_tracking_params)

    respond_to do |format|
      if @incidences_tracking.save
        format.html { redirect_to @incidences_tracking, notice: 'Incidences tracking ha sido creado.' }
        format.json { render :show, status: :created, location: @incidences_tracking }
      else
        format.html { render :new }
        format.json { render json: @incidences_tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidences_trackings/1
  # PATCH/PUT /incidences_trackings/1.json
  def update
    respond_to do |format|
      if @incidences_tracking.update(incidences_tracking_params)
        format.html { redirect_to @incidences_tracking, notice: 'Incidences tracking ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @incidences_tracking }
      else
        format.html { render :edit }
        format.json { render json: @incidences_tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidences_trackings/1
  # DELETE /incidences_trackings/1.json
  def destroy
    @incidences_tracking.destroy
    respond_to do |format|
      format.html { redirect_to incidences_trackings_url, notice: 'Incidences tracking ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidences_tracking
      @incidences_tracking = IncidencesTracking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidences_tracking_params
      params.require(:incidences_tracking).permit(:incidence_tracking_id, :state, :incidence_id, :user_id, :comment)
    end
end
