class CreateEventoDeportivos < ActiveRecord::Migration
  def change
    create_table :evento_deportivos do |t|
      t.string :nombre
      t.date :fecha_inicio
      t.date :fecha_fin
      t.string :lugar
      t.string :horario
      t.text :detalles_adicionales

      t.timestamps
    end
  end
end
