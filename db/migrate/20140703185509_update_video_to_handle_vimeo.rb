class UpdateVideoToHandleVimeo < ActiveRecord::Migration
  def up
    remove_column :videos, :mp4
    remove_column :videos, :ogg
    add_column :videos, :vimeo_id, :string
  end

  def down
  end
end
