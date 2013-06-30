class RemoveAttachmentsFromVideos < ActiveRecord::Migration
  def up
    add_column :videos, :mp4_link, :string
    add_column :videos, :ogg_link, :string
    add_column :videos, :thumb_link, :string

    Video.all.each do |video|
      video.mp4_link = video.video.url
      video.ogg_link = video.ogg.url
      video.thumb_link = video.thumb(:poster)
      video.save
    end

    remove_column :videos, :video_file_name
    remove_column :videos, :video_content_type
    remove_column :videos, :video_file_size
    remove_column :videos, :video_updated_at

    remove_column :videos, :thumb_file_name
    remove_column :videos, :thumb_content_type
    remove_column :videos, :thumb_file_size
    remove_column :videos, :thumb_updated_at

    remove_column :videos, :ogg_file_name
    remove_column :videos, :ogg_content_type
    remove_column :videos, :ogg_file_size
    remove_column :videos, :ogg_updated_at

  end

  def down
  end
end
