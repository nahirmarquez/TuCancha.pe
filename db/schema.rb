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

ActiveRecord::Schema.define(:version => 20120712080552) do

  create_table "espacio_deportivos", :force => true do |t|
    t.string   "nombre"
    t.decimal  "costo"
    t.integer  "capacidad"
    t.string   "descripcion"
    t.integer  "local_deportivo_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "evento_deportivos", :force => true do |t|
    t.string   "nombre"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.string   "lugar"
    t.string   "horario"
    t.text     "detalles_adicionales"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "local_deportivos", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.text     "descripcion"
    t.text     "servicios"
    t.string   "contacto"
    t.string   "telefono"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end