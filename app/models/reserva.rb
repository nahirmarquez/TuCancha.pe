class Reserva < ActiveRecord::Base
  attr_accessible :espacio_deportivo_id, :fecha, :hora_fin, :hora_inicio, :uid
  validates_uniqueness_of :espacio_deportivo_id, :scope => [:fecha, :hora_inicio, :hora_fin], :message => ": El espacio deportivo no se encuentra disponible para la fecha y hora indicada"
  validates_presence_of :hora_inicio , :message => ": La hora de inicio no puede estar en blanco"
  validates_presence_of :hora_fin , :message => ": La hora de fin no puede estar en blanco"
  validates_numericality_of :hora_inicio , :message => ": La hora de inicio debe ser un valor numerico"
  validates_numericality_of :hora_fin , :message => ": La hora de fin debe ser un valor numerico"
end
