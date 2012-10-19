class Ww3 < ActiveRecord::Migration
  def up
     create_table :usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :nombre
      t.string :apellido
      t.string :edad
      t.string :telefono
      t.timestamps
    end
  end

  def down
  end
end
