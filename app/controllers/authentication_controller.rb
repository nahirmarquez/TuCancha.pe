class AuthenticationController < ApplicationController
  
  def create
    auth_info = env["omniauth.auth"]
    user = User.from_omniauth(auth_info)
  
    usuario = Usuario.where("email=?",auth_info.info.email).first
    if usuario==nil
      usuario = Usuario.new
      usuario.nombre = auth_info.info.first_name
      usuario.apellido = auth_info.info.last_name
      usuario.email = auth_info.info.email
      usuario.rol = "1";
      usuario.tipo = "2" #facebook
      usuario.password_digest = "xxxxxx" ##TODO eliminar validacion hash
      usuario.save!
    end
    
    session[:usuario_id] = usuario.id    
    session[:user_id] = user.id
    redirect_to root_url
  end
  

  def destroy
    session[:user_id] = nil
    session[:usuario_id] = nil ##Sale de la app tambien
    redirect_to root_url
  end
  
end