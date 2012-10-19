class AddEstadoToLocalDeportivo < ActiveRecord::Migration
  def change
    add_column :local_deportivos, :estado, :string
  end
end