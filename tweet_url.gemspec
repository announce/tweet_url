# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tweet_url/version'

Gem::Specification.new do |spec|
  spec.name          = 'tweet_url'
  spec.version       = TweetUrl::VERSION
  spec.authors       = ['Kenta Yamamoto']
  spec.email         = ['ymkjp@jaist.ac.jp']
  spec.summary       = 'Twitter URL parser'
  spec.description   = 'Extract username and status_id from tweet URL'
  spec.homepage      = 'https://github.com/announce/tweet_url'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'addressable'
end
