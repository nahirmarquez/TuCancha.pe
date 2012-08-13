class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.integer :espacio_deportivo_id
      t.date :fecha
      t.string :hora_inicio
      t.string :hora_fin
      t.string :uid

      t.timestamps
    end
  end
end
