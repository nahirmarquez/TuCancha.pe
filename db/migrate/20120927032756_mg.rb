class Mg < ActiveRecord::Migration
  def up
    drop_attached_file :local_deportivos, :imagen
  end

  def down
  end
end
