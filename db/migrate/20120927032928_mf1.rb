class Mf1 < ActiveRecord::Migration
  def self.up
    change_table :local_deportivos do |t|
      t.has_attached_file :imagen_ld
    end
  end

  def down
  end
end
