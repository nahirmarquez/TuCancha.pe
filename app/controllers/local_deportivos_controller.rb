
class LocalDeportivosController < ApplicationController
  # GET /local_deportivos
  # GET /local_deportivos.json
  def index
        
    @local_deportivos = LocalDeportivo.where("estado = 'C' OR estado is NULL")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @local_deportivos }
    end
  end
  
  def busqueda
    @local_deportivos = LocalDeportivo.where("estado = 'C' OR estado is NULL")

    respond_to do |format|
      format.html # busqueda.html.erb
      format.json { render json: @local_deportivos }
    end
  end

  # GET /local_deportivos/1
  # GET /local_deportivos/1.json
  def show
    @local_deportivo = LocalDeportivo.find(params[:id], :conditions=> "estado = 'C' OR estado is NULL")
    
    @espacio_deportivos = @local_deportivo.espacio_deportivos.find(:all)
    
    
    respond_to do |format|
      format.html 
      format.json { render json: {:espacio_deportivos =>@espacio_deportivos, :local_deportivo => @local_deportivo }}
    end
    
  end

  # GET /local_deportivos/new
  # GET /local_deportivos/new.json
  def new
    
    if current_user || usuario_logueado    
      @local_deportivo = LocalDeportivo.new      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @local_deportivo }
      end
    else
      session[:return_to] = "/local_deportivos/new"
      redirect_to "/login"
    end
  end

  # GET /local_deportivos/1/edit
  def edit
    @local_deportivo = LocalDeportivo.find(params[:id], :conditions=> "estado = 'C' OR estado is NULL")
  end

  # POST /local_deportivos
  # POST /local_deportivos.json
  def create
    @local_deportivo = LocalDeportivo.new(params[:local_deportivo])   
    
    if(usuario_logueado.rol=="3")
      @local_deportivo.estado = "C"      
    else 
      @local_deportivo.estado = "T"
    end 
    
    @local_deportivo.usuario_id = usuario_logueado.id  
    
    if @local_deportivo.save
         if(usuario_logueado.rol=="3")
         redirect_to root_url, :notice => "Su local sido creado satisfactoriamente!"
         else
         redirect_to root_url, :notice => "Se ha registrado una solicitud de creacion de Local Deportivo. Esta pendiente de aprobacion por un Administrador"
         end
    else
          respond_to do |format|
            format.html { render action: "new" }
            format.json { render json: @local_deportivo.errors, status: :unprocessable_entity }
          end
    end
  end

  # PUT /local_deportivos/1
  # PUT /local_deportivos/1.json
  def update
    @local_deportivo = LocalDeportivo.find(params[:id],  :conditions=> "estado = 'C' OR estado is NULL" )
        
    respond_to do |format|
      if @local_deportivo.update_attributes(params[:local_deportivo])
        format.html { redirect_to root_url, :notice => "Local Deportivo actualizado correctamente" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @local_deportivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_deportivos/1
  # DELETE /local_deportivos/1.json
  def destroy
    @local_deportivo = LocalDeportivo.find(params[:id],  :conditions=> "estado = 'C' OR estado is NULL" )
    @local_deportivo.destroy

    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Se elimino correctamente el Local Deportivo" }
      format.json { head :no_content }
    end
  end
  
  def ver_solicitudes
    @local_deportivos = LocalDeportivo.where("estado = 'T'")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @local_deportivos }
    end
  end
  
  def editar_solicitud
    @local_deportivo = LocalDeportivo.find(params[:id], :conditions=> "estado = 'T'")
  end
  
  def confirmar_solicitud
    logger.info(params[:aceptar])
    @local_deportivo = LocalDeportivo.find(params[:id],  :conditions=> "estado = 'T'" )
    if(params[:aceptar])
      @local_deportivo.estado = "C"
      mi_mensaje = "Se ha aprobado la solicitud seleccionada!"
    else
      @local_deportivo.estado = "R"
       mi_mensaje = "Se ha rechazado la solicitud seleccionada!"
    end

    @usuario = @local_deportivo.usuario;
    
    if @usuario!= nil
       @usuario.rol = "2"
       @usuario.save
    end 

    if @local_deportivo.save
        redirect_to root_url, :notice => mi_mensaje
    else
      
      
    end
  end
  
  
  def ver_mis_locales
    @local_deportivos = LocalDeportivo.where("usuario_id=? AND estado='C'", usuario_logueado.id)
  end
  
  
  def ver_mi_local
      @local_deportivo = LocalDeportivo.find(params[:id], :conditions=> "estado = 'C' OR estado is NULL")
    
    @espacio_deportivos = @local_deportivo.espacio_deportivos.find(:all)
    
    
    respond_to do |format|
      format.html 
      format.json { render json: {:espacio_deportivos =>@espacio_deportivos, :local_deportivo => @local_deportivo }}
    end
  end
end
