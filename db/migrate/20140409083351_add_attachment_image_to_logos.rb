class AddAttachmentImageToLogos < ActiveRecord::Migration
  def self.up
    change_table :logos do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :logos, :image
  end
end
