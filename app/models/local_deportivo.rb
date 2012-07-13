class LocalDeportivo < ActiveRecord::Base
  attr_accessible :contacto, :descripcion, :direccion, :email, :nombre, :servicios, :telefono
  validates_uniqueness_of :nombre, :message => "ya se encuentra registrado"
  has_many :espacio_deportivos
end
