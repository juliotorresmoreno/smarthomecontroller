class IncidencesController < ApplicationController
  before_action :set_incidence, only: [:show, :edit, :update, :destroy]

  # GET /incidences
  # GET /incidences.json
  def index
    @incidences = Incidence.all
  end

  # GET /incidences/1
  # GET /incidences/1.json
  def show
  end

  # GET /incidences/new
  def new
    @incidence = Incidence.new
  end

  # GET /incidences/1/edit
  def edit
  end

  # POST /incidences
  # POST /incidences.json
  def create
    @incidence = Incidence.new(incidence_params)

    respond_to do |format|
      if @incidence.save
        format.html { redirect_to @incidence, notice: 'Incidence was successfully created.' }
        format.json { render :show, status: :created, location: @incidence }
      else
        format.html { render :new }
        format.json { render json: @incidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidences/1
  # PATCH/PUT /incidences/1.json
  def update
    respond_to do |format|
      if @incidence.update(incidence_params)
        format.html { redirect_to @incidence, notice: 'Incidence was successfully updated.' }
        format.json { render :show, status: :ok, location: @incidence }
      else
        format.html { render :edit }
        format.json { render json: @incidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidences/1
  # DELETE /incidences/1.json
  def destroy
    @incidence.destroy
    respond_to do |format|
      format.html { redirect_to incidences_url, notice: 'Incidence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidence
      @incidence = Incidence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidence_params
      params.require(:incidence).permit(:incidence_id, :state, :title, :description, :incidence_type_id, :progress, :created_at, :update_at, :delete_at)
    end
end
