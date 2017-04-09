class PublicacionController < ApplicationController
    def new
        @publicacion = Publicacion.new
    end

    def index
        @publicaciones = Publicacion.all
    end

    def create
        @publicacion = Publicacion.new(params[:publicacion].permit(:titulo, :contenido))
        @publicacion.save
        redirect_to publicacion_path    # esta ruta se explica a continuación
    end
end
