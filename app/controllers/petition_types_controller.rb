class PetitionTypesController < ApplicationController
  before_action :set_petition_type, only: [:show, :edit, :update, :destroy]

  # GET /petition_types
  # GET /petition_types.json
  def index
    @petition_types = PetitionType.all
  end

  # GET /petition_types/1
  # GET /petition_types/1.json
  def show
  end

  # GET /petition_types/new
  def new
    @petition_type = PetitionType.new
  end

  # GET /petition_types/1/edit
  def edit
  end

  # POST /petition_types
  # POST /petition_types.json
  def create
    @petition_type = PetitionType.new(petition_type_params)

    respond_to do |format|
      if @petition_type.save
        format.html { redirect_to @petition_type, notice: 'Petition type was successfully created.' }
        format.json { render :show, status: :created, location: @petition_type }
      else
        format.html { render :new }
        format.json { render json: @petition_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petition_types/1
  # PATCH/PUT /petition_types/1.json
  def update
    respond_to do |format|
      if @petition_type.update(petition_type_params)
        format.html { redirect_to @petition_type, notice: 'Petition type was successfully updated.' }
        format.json { render :show, status: :ok, location: @petition_type }
      else
        format.html { render :edit }
        format.json { render json: @petition_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petition_types/1
  # DELETE /petition_types/1.json
  def destroy
    @petition_type.destroy
    respond_to do |format|
      format.html { redirect_to petition_types_url, notice: 'Petition type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition_type
      @petition_type = PetitionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petition_type_params
      params.require(:petition_type).permit(:petition_type_id, :state, :name, :created_at, :update_at, :delete_at)
    end
end
