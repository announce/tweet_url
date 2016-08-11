require 'spec_helper'

describe TweetUrl do

  it 'has a version number' do
    expect(TweetUrl::VERSION).not_to be nil
  end

  let!(:username) { 'i05' }
  let!(:status_id) { 658113992410292224 }

  describe TweetUrl::Base do
    let(:tweet_url) { TweetUrl.parse("https://twitter.com/#{username}/status/#{status_id}") }

    it { expect(tweet_url).to be_instance_of(TweetUrl::Base)}
    it { expect(tweet_url.username).to eq username }
    it { expect(tweet_url.status_id).to eq status_id }
  end

  context 'with parser option' do
    let(:tweet_url) {
      require 'addressable/uri'
      TweetUrl.parse(
        "https://twitter.com/#{username}/status/#{status_id}#マルチバイト",
        parser: Addressable::URI)
    }

    it { expect(tweet_url).to be_instance_of(TweetUrl::Base)}
    it { expect(tweet_url.parser).to be Addressable::URI}
    it { expect(tweet_url.username).to eq username }
    it { expect(tweet_url.status_id).to eq status_id }
  end

end
