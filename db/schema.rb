# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121017025651) do

  create_table "espacio_deportivos", :force => true do |t|
    t.string    "nombre"
    t.decimal   "costo"
    t.integer   "capacidad"
    t.string    "descripcion"
    t.integer   "local_deportivo_id"
    t.timestamp "created_at",         :null => false
    t.timestamp "updated_at",         :null => false
  end

  create_table "evento_deportivos", :force => true do |t|
    t.string    "nombre"
    t.date      "fecha_inicio"
    t.date      "fecha_fin"
    t.string    "lugar"
    t.string    "horario"
    t.text      "detalles_adicionales"
    t.timestamp "created_at",           :null => false
    t.timestamp "updated_at",           :null => false
  end

  create_table "local_deportivos", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.text     "descripcion"
    t.text     "servicios"
    t.string   "contacto"
    t.string   "telefono"
    t.string   "email"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "latitud"
    t.string   "longitud"
    t.string   "imagen_ld_file_name"
    t.string   "imagen_ld_content_type"
    t.integer  "imagen_ld_file_size"
    t.datetime "imagen_ld_updated_at"
    t.string   "estado"
    t.integer  "usuario_id"
  end

  create_table "reservas", :force => true do |t|
    t.integer   "espacio_deportivo_id"
    t.date      "fecha"
    t.string    "hora_inicio"
    t.string    "hora_fin"
    t.string    "uid"
    t.timestamp "created_at",           :null => false
    t.timestamp "updated_at",           :null => false
    t.integer   "usuario_id"
  end

  create_table "users", :force => true do |t|
    t.string    "provider"
    t.string    "uid"
    t.string    "name"
    t.string    "oauth_token"
    t.timestamp "oauth_expires_at"
    t.timestamp "created_at",       :null => false
    t.timestamp "updated_at",       :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "apellido"
    t.string   "edad"
    t.string   "telefono"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "rol"
    t.string   "tipo"
  end

end
