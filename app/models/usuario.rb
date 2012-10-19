class Usuario < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :nombre, :apellido, :telefono, :edad, :password_digest, :rol, :tipo
  has_secure_password
  validates_presence_of :password, :on => :create  , :if => :usuario_aplicacion?
  validates_presence_of :nombre, :message => ": Por favor ingrese su nombre" 
  validates_presence_of :apellido, :message => ": Por favor ingrese su apellido" 
  validates_presence_of :password , :message => ": Por favor ingrese su password"  , :if => :usuario_aplicacion?
  validates_numericality_of :telefono , :message => ": El valor del campo telefono debe ser numerico"  , :if => :usuario_aplicacion?
  validates_numericality_of :edad , :message => ": El valor del campo edad debe ser numerico"  , :if => :usuario_aplicacion?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  has_many :reservas
  has_many :local_deportivos
  
  def usuario_aplicacion?
    tipo == '1'
  end
   
end
