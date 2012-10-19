class AddUsuarioIdToLocalDeportivos < ActiveRecord::Migration
  def change
    add_column :local_deportivos, :usuario_id, :integer
  end
end
