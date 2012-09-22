
class EspacioDeportivosController < ApplicationController
  # GET /espacio_deportivos
  # GET /espacio_deportivos.json
  def index
    @espacio_deportivos = EspacioDeportivo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @espacio_deportivos }
    end
  end

  # GET /espacio_deportivos/1
  # GET /espacio_deportivos/1.json
  def show
    @espacio_deportivo = EspacioDeportivo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @espacio_deportivo }
    end
  end
  
  
  def findbylocal
    @local_dep_ori = LocalDeportivo.find(params[:id])
    @espacio_deportivos = @local_dep_ori.espacio_deportivos.find(:all)
    respond_to do |format|
      format.html # findbylocal.html.erb
      format.json { render json: @espacio_deportivos }
    end
  end
  

  # GET /espacio_deportivos/new
  # GET /espacio_deportivos/new.json
  def new
    @espacio_deportivo = EspacioDeportivo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @espacio_deportivo }
    end
  end

  # GET /espacio_deportivos/1/edit
  def edit
    @espacio_deportivo = EspacioDeportivo.find(params[:id])
  end

  # POST /espacio_deportivos
  # POST /espacio_deportivos.json
  def create
    @espacio_deportivo = EspacioDeportivo.new(params[:espacio_deportivo])

    respond_to do |format|
      if @espacio_deportivo.save
        format.html { redirect_to @espacio_deportivo, notice: 'Espacio deportivo was successfully created.' }
        format.json { render json: @espacio_deportivo, status: :created, location: @espacio_deportivo }
      else
        format.html { render action: "new" }
        format.json { render json: @espacio_deportivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /espacio_deportivos/1
  # PUT /espacio_deportivos/1.json
  def update
    @espacio_deportivo = EspacioDeportivo.find(params[:id])

    respond_to do |format|
      if @espacio_deportivo.update_attributes(params[:espacio_deportivo])
        format.html { redirect_to @espacio_deportivo, notice: 'Espacio deportivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @espacio_deportivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /espacio_deportivos/1
  # DELETE /espacio_deportivos/1.json
  def destroy
    @espacio_deportivo = EspacioDeportivo.find(params[:id])
    @espacio_deportivo.destroy

    respond_to do |format|
      format.html { redirect_to espacio_deportivos_url }
      format.json { head :no_content }
    end
  end
end
