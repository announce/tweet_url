require 'tweet_url/uri'

module TweetUrl
  module Username
    # Take a URI string or URI object and return its username
    # @param object [String, URI] An ID, URI, or object.
    # @return [String, NilClass]
    def self.username(object, parser = DEFAULT_PARSER)
      case object
        when ::String
          Username::username(parser.parse(object), parser)
        when URI, parser
          Username::username(Uri.hashbang_path_or_path(object).split('/'))
        when Enumerable
          object[1]
        else
          nil
      end
    end

    def username
      Username::username(@url, @parser)
    end
  end
end
