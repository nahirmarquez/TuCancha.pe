class AddLatLongToLocalDeportivo < ActiveRecord::Migration
  def change
    add_column :local_deportivos, :latitud, :string
    add_column :local_deportivos, :longitud, :string
  end
end
