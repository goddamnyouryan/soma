require 'net/http'

module Vimeo
  class Video
    def initialize(url)
      @url = url
    end

    def fetch
      result = Net::HTTP.get URI.parse(oembed_url)
      JSON result
    end

    def oembed_url
      "http://vimeo.com/api/oembed.json?url=#{@url}"
    end
  end
end
