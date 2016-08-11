require 'uri'
require 'tweet_url/version'
require 'tweet_url/username'
require 'tweet_url/status'

# @param  url [String, URI]
# @param
# @option opts [Object] :parser URI parser such as Addressable::URI
module TweetUrl
  DEFAULT_PARSER = URI

  class Base
    include Username
    include Status
    attr_accessor :url, :parser
    def initialize(url, opts = {})
      @url = url
      @parser = opts.has_key?(:parser) ? opts[:parser] : DEFAULT_PARSER
    end
  end

  def self.parse(url, opts = {})
    Base.new(url, opts)
  end

end
