class RenameAttachmentColumns < ActiveRecord::Migration
  def up
    rename_column :videos, :mp4_link, :mp4
    rename_column :videos, :ogg_link, :ogg
    rename_column :videos, :thumb_link, :thumb
  end

  def down
  end
end
