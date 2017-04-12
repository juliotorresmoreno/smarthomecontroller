class AuthController < ApplicationController
    def signup
        if params[:password] != params[:password_confirm]
            render 'home/signup', locals: { 
                :data => params, 
                :errors => ["Password Debes confirmar la contraseña."]
            }
            return
        end
        @existe = User.where("email = '#{params[:email]}'").count
        if @existe == 0
            @user = User.new
            @user.name      = params[:name]
            @user.lastname  = params[:lastname]
            @user.fullname  = params[:name] + " " + params[:lastname]
            @user.email     = params[:email]
            @user.password  = params[:password]
            @user.perfil_id = 2

            data = params[:password]
            password = self.password
            encrypted = data.encrypt(:symmetric, :algorithm => 'des-ecb', :password => password) 
            @user.password = encrypted

            if @user.save
                render 'signup', locals: {
                    :mensaje => "Registro exitoso."
                }
            else
                render 'home/signup', locals: {
                    :errors => @user.errors.full_messages
                }
            end
        else
            render 'home/signup', locals: {
                :data => params,
                :errors => ["Email El usuario ya existe."]
            }
        end
    end
    def login
        if @user = User.where("email = '#{params[:email]}'").first
            encrypted = @user.password
            password = self.password
            decrypt = encrypted.decrypt(:symmetric, :algorithm => 'des-ecb', :password => password)
            if decrypt == params[:password]
                redirect_to '/'                
            end
        end
        render 'home/login', locals: { :errors => ["Email El usuario o la contraseña no son validos."] }
    end
    def password
        return "paramore"
    end
end
