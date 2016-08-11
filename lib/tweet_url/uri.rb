module TweetUrl
  module Uri

    def self.find_resource_id(list, &block)
      index = list.index(&block)
      return index if index.nil?
      target = list[index + 1]
      target.nil? ? target : target.to_i
    end

    # @param object [URI]
    # @return [String]
    def self.hashbang_path_or_path(object)
      (not object.fragment.nil? and object.fragment.chars.first == '!') ?
          object.fragment :
          object.path
    end
  end

end
