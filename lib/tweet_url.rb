require 'uri'
require 'tweet_url/version'
require 'tweet_url/username'
require 'tweet_url/status'

# Extract username and status_id from tweet URL
# @example
#   require 'addressable/uri'
#   require 'tweet_url'
#   tweet_url = TweetUrl.parse(
#     'https://twitter.com/yukihiro_matz/status/755950562227605504#尾骶骨',
#     parser: Addressable::URI)
#   tweet_url.username  #=> "yukihiro_matz"
#   tweet_url.status_id  #=> 755950562227605504
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

  # @param  url [String, URI]
  # @param
  # @option opts [Object] :parser URI parser such as Addressable::URI
  def self.parse(url, opts = {})
    Base.new(url, opts)
  end

end
