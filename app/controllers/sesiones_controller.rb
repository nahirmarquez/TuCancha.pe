class SesionesController < ApplicationController
  def new

  end

  def create
    usuario = Usuario.find_by_email(params[:email])
 
    url_retorno = session[:return_to]
    session[:return_to] = nil
 
    if usuario && usuario.authenticate(params[:password])
      session[:usuario_id] = usuario.id
      if url_retorno != nil
        redirect_to url_retorno
      else
        redirect_to root_url, :notice => "Autenticado Correctamente"
      end
    else
      flash.now.alert = "Usuario o Password Incorrecto"
      render "new"
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_url, :notice => "Salio del sistema correctamente"
  end
  
end
