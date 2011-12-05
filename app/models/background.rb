class Background < ActiveRecord::Base
  
  if RAILS_ENV == "development"
    has_attached_file :photo, :styles => { :thumb => "196x110#" },
                              :storage => :s3, 
                              :s3_credentials => "#{RAILS_ROOT}/config/s3-background.yml", 
                              :path => ':id/:style',
                              :s3_host_alias => 'd47761q66xcfi.cloudfront.net',
                              :url => ':s3_alias_url'
                              
  elsif RAILS_ENV == "production"
    has_attached_file :thumb, :styles => { :thumb => "196x110#" },
                              :storage => :s3, 
                              :s3_credentials => "#{RAILS_ROOT}/config/s3-background.yml", 
                              :path => ':id/:style',
                              :s3_host_alias => 'd1e5704fyyxas9.cloudfront.net',
                              :url => ':s3_alias_url'

  end
  
end
