class EspacioDeportivo < ActiveRecord::Base
  attr_accessible :capacidad, :costo, :descripcion, :local_deportivo_id, :nombre
  validates_presence_of :nombre , :message => ": Por favor ingrese nombre del espacio"
  validates_presence_of :descripcion , :message => ": Por favor ingrese la descripcion"
  validates_numericality_of :capacidad , :message => ": La capacidad debe ser un valor numerico"
  validates_numericality_of :costo , :message => ": El costo del alquiler debe ser numerico" 
  belongs_to :local_deportivo
end
