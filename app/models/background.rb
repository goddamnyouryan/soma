class Background < ActiveRecord::Base

  if Rails.env == "development"
    has_attached_file :photo, :styles => { :thumb => "196x110#" },
                              :storage => :s3,
                              :s3_credentials => "#{Rails.root}/config/s3-background.yml",
                              :path => ':id/:style',
                              :s3_host_alias => 'd47761q66xcfi.cloudfront.net',
                              :url => ':s3_alias_url'

  elsif Rails.env == "production"
    has_attached_file :photo, :styles => { :thumb => "196x110#" },
                              :storage => :s3,
                              :s3_credentials => "#{Rails.root}/config/s3-background.yml",
                              :path => ':id/:style',
                              :s3_host_alias => 'd1e5704fyyxas9.cloudfront.net',
                              :url => ':s3_alias_url'

  end
end
