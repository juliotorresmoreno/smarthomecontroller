class AuthController < ApplicationController
    def signup
        if params[:password] != params[:password_confirm]
            render 'home/signup', locals: { :data => params, :password => "Debes confirmar la contraseña." }
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
            @user.save
            render 'signup', locals: { :mensaje => "Registro exitoso." }
        else
            render 'home/signup', locals: { :data => params, :email => "El usuario ya existe." }
        end
    end
end
