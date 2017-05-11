class RecoveryPasswordsController < ApplicationController
  before_action :set_recovery_password, only: [:show, :edit, :update, :destroy]

  # GET /recovery_passwords
  # GET /recovery_passwords.json
  def index
    @recovery_passwords = RecoveryPassword.all
  end

  # GET /recovery_passwords/1
  # GET /recovery_passwords/1.json
  def show
  end

  # GET /recovery_passwords/new
  def new
    @recovery_password = RecoveryPassword.new
  end

  # GET /recovery_passwords/1/edit
  def edit
  end

  # POST /recovery_passwords
  # POST /recovery_passwords.json
  def create
    @recovery_password = RecoveryPassword.new(recovery_password_params)

    respond_to do |format|
      if @recovery_password.save
        format.html { redirect_to @recovery_password, notice: 'Recovery password ha sido creado.' }
        format.json { render :show, status: :created, location: @recovery_password }
      else
        format.html { render :new }
        format.json { render json: @recovery_password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recovery_passwords/1
  # PATCH/PUT /recovery_passwords/1.json
  def update
    respond_to do |format|
      if @recovery_password.update(recovery_password_params)
        format.html { redirect_to @recovery_password, notice: 'Recovery password ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @recovery_password }
      else
        format.html { render :edit }
        format.json { render json: @recovery_password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recovery_passwords/1
  # DELETE /recovery_passwords/1.json
  def destroy
    @recovery_password.destroy
    respond_to do |format|
      format.html { redirect_to recovery_passwords_url, notice: 'Recovery password ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recovery_password
      @recovery_password = RecoveryPassword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recovery_password_params
      params.require(:recovery_password).permit(:recovery_password_id, :state, :user_id, :token, :progress)
    end
end
