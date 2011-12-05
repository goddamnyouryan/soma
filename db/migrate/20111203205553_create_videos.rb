class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.string :client
      t.integer :order
      t.string :video_file_name
      t.string :video_content_type
      t.integer :video_file_size
      t.datetime :video_updated_at
      t.string :thumb_file_name
      t.string :thumb_content_type
      t.integer :thumb_file_size
      t.datetime :thumb_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
