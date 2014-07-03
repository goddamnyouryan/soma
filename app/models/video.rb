class Video < ActiveRecord::Base
  before_validation :set_thumb_and_vimeo_id, if: :vimeo?

  validates :thumb, :vimeo_id, presence: true

  attr_accessor :vimeo

  def vimeo?
    vimeo.present?
  end

  private

  def set_thumb_and_vimeo_id
    json = Vimeo::Video.new(vimeo).fetch
    self.thumb = json['thumbnail_url']
    self.vimeo_id = json['video_id']
  end
end
