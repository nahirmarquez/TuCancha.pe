class EventoDeportivo < ActiveRecord::Base
  attr_accessible :detalles_adicionales, :fecha_fin, :fecha_inicio, :horario, :lugar, :nombre
end
