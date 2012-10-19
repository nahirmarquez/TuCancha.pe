class AddTipoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :tipo, :string
  end
end
