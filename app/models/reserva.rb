class Reserva < ActiveRecord::Base
  attr_accessible :espacio_deportivo_id, :fecha, :hora_fin, :hora_inicio, :uid, :usuario_id
  validates_presence_of :fecha , :message => ": La fecha no puede estar en blanco"
  validate :reserva_duracion_minima 
  validates_presence_of :hora_inicio , :message => ": La hora de inicio no puede estar en blanco"
  validates_presence_of :hora_fin , :message => ": La hora de fin no puede estar en blanco"
  validates_numericality_of :hora_inicio , :message => ": La hora de inicio debe ser un valor numerico"
  validates_numericality_of :hora_fin , :message => ": La hora de fin debe ser un valor numerico"
  validates_uniqueness_of :espacio_deportivo_id, :scope => [:fecha, :hora_inicio, :hora_fin], :message => ": El espacio deportivo no se encuentra disponible para la fecha y hora indicada"
  belongs_to :usuario
  belongs_to :espacio_deportivo

 def reserva_duracion_minima
    self.errors[:base] << "La hora de inicio debe ser mayor a la hora de fin" if self.hora_inicio.to_i >= self.hora_fin.to_i
  end

end
