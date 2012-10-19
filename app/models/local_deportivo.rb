class LocalDeportivo < ActiveRecord::Base
  attr_accessible :contacto, :descripcion, :direccion, :email, :nombre, :servicios, :telefono, :latitud, :longitud, :imagen_ld
  validates_presence_of :direccion , :message => ": Por favor ingrese la direccion"
  validates_presence_of :nombre , :message => ": Por favor ingrese el nombre del local deportivo"  
  validates_numericality_of :latitud , :message => ": El valor de la latitud debe ser numerico"
  validates_numericality_of :longitud , :message => ": El valor de la longitud debe ser numerico"  
  validates_uniqueness_of :nombre, :message => ": El nombre ya se encuentra registrado"
  has_many :espacio_deportivos
  belongs_to :usuario
  
    has_attached_file :imagen_ld,
                    :url  => "/assets/local_deportivo/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/local_deportivo/:id/:style/:basename.:extension"
         
end
