class EspacioDeportivo < ActiveRecord::Base
  attr_accessible :capacidad, :costo, :descripcion, :local_deportivo_id, :nombre
  
  belongs_to :local_deportivo
end
