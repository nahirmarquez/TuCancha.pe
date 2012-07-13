class CreateEspacioDeportivos < ActiveRecord::Migration
  def change
    create_table :espacio_deportivos do |t|
      t.string :nombre
      t.decimal :costo
      t.integer :capacidad
      t.string :descripcion
      t.integer :local_deportivo_id

      t.timestamps
    end
  end
end
