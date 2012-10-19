class AddAttachmentImagenToLocalDeportivos < ActiveRecord::Migration
  def self.up
    change_table :local_deportivos do |t|
      t.has_attached_file :imagen
    end
  end

  def self.down
    drop_attached_file :local_deportivos, :imagen
  end
end
