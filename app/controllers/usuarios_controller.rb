class UsuariosController < ApplicationController
    def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    #TODO Borrar hardcode OK
    #@usuario.rol = "3";
    
    ##TODO agarrar rol
    if @usuario.rol == nil
      @usuario.rol = "1"
    end
    ##tipo_usuario = aplicacion
    @usuario.tipo = "1"
    
    if @usuario.save
      redirect_to root_url, :notice => "Su usuario ha sido creado satisfactoriamente!"
    else
      render "new"
    end
  end
end


