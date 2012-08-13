class Reserva < ActiveRecord::Base
  attr_accessible :espacio_deportivo_id, :fecha, :hora_fin, :hora_inicio, :uid
  validates_uniqueness_of :espacio_deportivo_id, :scope => [:fecha, :hora_inicio, :hora_fin], :message => "El espacio deportivo no se encuentra disponible para la fecha y hora indicada"
end
