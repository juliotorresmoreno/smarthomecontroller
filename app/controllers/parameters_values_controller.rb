class ParametersValuesController < ApplicationController
  before_action :set_parameters_value, only: [:show, :edit, :update, :destroy]

  # GET /parameters_values
  # GET /parameters_values.json
  def index
    @parameters_values = ParametersValue.all
  end

  # GET /parameters_values/1
  # GET /parameters_values/1.json
  def show
  end

  # GET /parameters_values/new
  def new
    @parameters_value = ParametersValue.new
  end

  # GET /parameters_values/1/edit
  def edit
  end

  # POST /parameters_values
  # POST /parameters_values.json
  def create
    @parameters_value = ParametersValue.new(parameters_value_params)

    respond_to do |format|
      if @parameters_value.save
        format.html { redirect_to @parameters_value, notice: 'Parameters value was successfully created.' }
        format.json { render :show, status: :created, location: @parameters_value }
      else
        format.html { render :new }
        format.json { render json: @parameters_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parameters_values/1
  # PATCH/PUT /parameters_values/1.json
  def update
    respond_to do |format|
      if @parameters_value.update(parameters_value_params)
        format.html { redirect_to @parameters_value, notice: 'Parameters value was successfully updated.' }
        format.json { render :show, status: :ok, location: @parameters_value }
      else
        format.html { render :edit }
        format.json { render json: @parameters_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parameters_values/1
  # DELETE /parameters_values/1.json
  def destroy
    @parameters_value.destroy
    respond_to do |format|
      format.html { redirect_to parameters_values_url, notice: 'Parameters value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameters_value
      @parameters_value = ParametersValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parameters_value_params
      params.require(:parameters_value).permit(:parameter_value_id, :state, :value, :parameter_id, :created_at, :update_at, :delete_at)
    end
end
