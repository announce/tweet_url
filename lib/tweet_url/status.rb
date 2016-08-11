require 'tweet_url/uri'

module TweetUrl
  module Status

    # Take a URI string or URI object and return its ID
    # @example
    #   status_id = TweetUrl::Status::status_id('https://twitter.com/sferik/status/540897316908331009/')
    #   status_id #=> 540897316908331009
    # @param object [Integer, String, URI] An ID, URI, or object.
    # @return [Integer, NilClass]
    def self.status_id(object, parser = DEFAULT_PARSER)
      case object
        when ::Integer
          object
        when ::String
          Status::status_id(parser.parse(object), parser)
        when parser
          Status::status_id(Uri.hashbang_path_or_path(object).split('/'))
        when Enumerable
          Uri::find_resource_id(object) {|s| /\Astatus(?:es)?\z/ === s}
        else
          nil
      end
    end

    def status_id
      Status::status_id(@url, @parser)
    end

  end
end
