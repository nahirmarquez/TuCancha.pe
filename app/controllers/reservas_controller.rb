
class ReservasController < ApplicationController
  # GET /reservas
  # GET /reservas.json
  def index
    @reservas = Reserva.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservas }
    end
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
    @reserva = Reserva.find(params[:id])
    @espacio_deportivo = EspacioDeportivo.find(@reserva.espacio_deportivo_id)
    @local_deportivo = LocalDeportivo.find(@espacio_deportivo.local_deportivo_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reserva }
    end
  end

  # GET /reservas/new
  # GET /reservas/new.json
  def new
    @reserva = Reserva.new
    @espacio_deportivo = EspacioDeportivo.find(params[:espacio_deportivo_id])
    @reserva.espacio_deportivo_id = @espacio_deportivo.id 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reserva }
    end
  end

  # GET /reservas/1/edit
  def edit
    @reserva = Reserva.find(params[:id])
  end

  # POST /reservas
  # POST /reservas.json
  def create
    @reserva = Reserva.new(params[:reserva])
    @reserva.espacio_deportivo_id = params[:reserva][:espacio_deportivo_id]
    @espacio_deportivo = EspacioDeportivo.find(params[:reserva][:espacio_deportivo_id])

    respond_to do |format|
      if @reserva.save
        logger.info(@reserva.errors.any?);
        format.html { redirect_to @reserva, notice: 'Reserva fue realizada correctamente.' }
        format.json { render json: @reserva, status: :created, location: @reserva }
      else
        format.html { render action: "new" }
        format.json { render json: @reserva }
      end
    end
  end

  # PUT /reservas/1
  # PUT /reservas/1.json
  def update
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      if @reserva.update_attributes(params[:reserva])
        format.html { redirect_to @reserva, notice: 'Reserva was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to reservas_url }
      format.json { head :no_content }
    end
  end
  
  def findbyfecha    
    @reservas = Reserva.where(:espacio_deportivo_id =>params[:id])
    @espacio_deportivo_id = params[:id]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservas }
    end
    
  end
  
end
