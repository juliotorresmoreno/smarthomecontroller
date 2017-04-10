class PetitionsTrackingsController < ApplicationController
  before_action :set_petitions_tracking, only: [:show, :edit, :update, :destroy]

  # GET /petitions_trackings
  # GET /petitions_trackings.json
  def index
    @petitions_trackings = PetitionsTracking.all
  end

  # GET /petitions_trackings/1
  # GET /petitions_trackings/1.json
  def show
  end

  # GET /petitions_trackings/new
  def new
    @petitions_tracking = PetitionsTracking.new
  end

  # GET /petitions_trackings/1/edit
  def edit
  end

  # POST /petitions_trackings
  # POST /petitions_trackings.json
  def create
    @petitions_tracking = PetitionsTracking.new(petitions_tracking_params)

    respond_to do |format|
      if @petitions_tracking.save
        format.html { redirect_to @petitions_tracking, notice: 'Petitions tracking was successfully created.' }
        format.json { render :show, status: :created, location: @petitions_tracking }
      else
        format.html { render :new }
        format.json { render json: @petitions_tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petitions_trackings/1
  # PATCH/PUT /petitions_trackings/1.json
  def update
    respond_to do |format|
      if @petitions_tracking.update(petitions_tracking_params)
        format.html { redirect_to @petitions_tracking, notice: 'Petitions tracking was successfully updated.' }
        format.json { render :show, status: :ok, location: @petitions_tracking }
      else
        format.html { render :edit }
        format.json { render json: @petitions_tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petitions_trackings/1
  # DELETE /petitions_trackings/1.json
  def destroy
    @petitions_tracking.destroy
    respond_to do |format|
      format.html { redirect_to petitions_trackings_url, notice: 'Petitions tracking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petitions_tracking
      @petitions_tracking = PetitionsTracking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petitions_tracking_params
      params.require(:petitions_tracking).permit(:petition_tracking_id, :state, :petition_id, :user_id, :comemnt, :created_at, :update_at, :delete_at)
    end
end
