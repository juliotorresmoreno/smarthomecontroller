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
        require 'json'
        redis = Redis.new
        if @user = User.where("email = '#{params[:email]}'").first
            encrypted = @user.password
            password = self.password
            decrypt = encrypted.decrypt(:symmetric, :algorithm => 'des-ecb', :password => password)
            if decrypt == params[:password]
                token = self.token
                data = {:id => @user.id }
                redis.set(token, data.to_json)
                response.set_header("Set-Cookie", "token=" + token + "; ") # + "; path=/; HttpOnly")
                redirect_to '/session'
                return
            end
        end
        render 'home/login', locals: { :errors => ["Email El usuario o la contraseña no son validos."] }
    end
    def auth
        require 'json'
        redis = Redis.new
        data  = redis.get(cookies[:token])
        render 'signup', locals: { :mensaje => data}
    end
    def token
        result = ""
        for value in 1..50 do
            result += rand(65..90).chr
        end
        return result
    end
    def password
        return "paramore"
    end
end