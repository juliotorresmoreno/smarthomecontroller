class UsersDescsController < ApplicationController
  before_action :set_users_desc, only: [:show, :edit, :update, :destroy]

  # GET /users_descs
  # GET /users_descs.json
  def index
    @users_descs = UsersDesc.all
  end

  # GET /users_descs/1
  # GET /users_descs/1.json
  def show
  end

  # GET /users_descs/new
  def new
    @users_desc = UsersDesc.new
  end

  # GET /users_descs/1/edit
  def edit
  end

  # POST /users_descs
  # POST /users_descs.json
  def create
    @users_desc = UsersDesc.new(users_desc_params)

    respond_to do |format|
      if @users_desc.save
        format.html { redirect_to @users_desc, notice: 'Users desc ha sido creado.' }
        format.json { render :show, status: :created, location: @users_desc }
      else
        format.html { render :new }
        format.json { render json: @users_desc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_descs/1
  # PATCH/PUT /users_descs/1.json
  def update
    respond_to do |format|
      if @users_desc.update(users_desc_params)
        format.html { redirect_to @users_desc, notice: 'Users desc ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @users_desc }
      else
        format.html { render :edit }
        format.json { render json: @users_desc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_descs/1
  # DELETE /users_descs/1.json
  def destroy
    @users_desc.destroy
    respond_to do |format|
      format.html { redirect_to users_descs_url, notice: 'Users desc ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_desc
      @users_desc = UsersDesc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_desc_params
      params.require(:users_desc).permit(:user_desc_id, :state, :sex_id, :city_residence_id, :phone, :address, :cell_phone, :birth_date, :user_id)
    end
end
