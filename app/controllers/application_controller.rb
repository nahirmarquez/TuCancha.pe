class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :current_event, :usuario_logueado

  private
  
  def current_event
    @current_event ||= Event.find(session[:event_id]) if session[:event_id]
  end

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
   def usuario_logueado
    @usuario_logueado||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end
  
  
end
