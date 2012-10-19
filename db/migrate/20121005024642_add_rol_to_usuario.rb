class AddRolToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :rol, :string
  end
end


