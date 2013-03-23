class Video < ActiveRecord::Base

  if RAILS_ENV == "development"
    has_attached_file :thumb, :styles => { :thumb => "290x163#", :poster => "840x473#"},
                              :storage => :s3,
                              :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                              :path => ':id/:style'#,
                              # :s3_host_alias => 'd2eg9jtzojfpjk.cloudfront.net',
                              #:url => ':s3_alias_url'

    has_attached_file :video, :storage => :s3,
                              :s3_credentials => "#{RAILS_ROOT}/config/s3-video.yml",
                              :path => ':id',
                              :s3_host_alias => 'dcjd67wbyjfmb.cloudfront.net',
                              :url => ':s3_alias_url'

    has_attached_file :ogg, :storage => :s3,
                              :s3_credentials => "#{RAILS_ROOT}/config/s3-ogg.yml",
                              :path => ':id',
                              :s3_host_alias => 'd2zv9v2awdzw9v.cloudfront.net',
                              :url => ':s3_alias_url'

  elsif RAILS_ENV == "production"
    has_attached_file :thumb, :styles => { :thumb => "290x163#", :poster => "840x473#"},
                              :storage => :s3, 
                              :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                              :path => ':id/:style',
                              :s3_host_alias => 'd116frzuh3c2sg.cloudfront.net',
                              :url => ':s3_alias_url'

    has_attached_file :video, :storage => :s3,
                              :s3_credentials => "#{RAILS_ROOT}/config/s3-video.yml", 
                              :path => ':id',
                              :s3_host_alias => 'd36ymaapgpqd1v.cloudfront.net',
                              :url => ':s3_alias_url'
                              
    has_attached_file :ogg, :storage => :s3, 
                              :s3_credentials => "#{RAILS_ROOT}/config/s3-ogg.yml", 
                              :path => ':id',
                              :s3_host_alias => 'd330mg4x7gp5l7.cloudfront.net',
                              :url => ':s3_alias_url'
  end
  
  validates_attachment_content_type :thumb, :content_type => ['image/jpeg', 'image/jpg', 'image/png'], :on => :create
  validates_attachment_content_type :video, :content_type => ['video/mp4'], :on => :create
  validates_attachment_content_type :ogg, :content_type => ['video/ogg'], :on => :create
end
