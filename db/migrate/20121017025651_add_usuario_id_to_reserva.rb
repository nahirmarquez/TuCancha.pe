class AddUsuarioIdToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :usuario_id, :integer
  end
end
