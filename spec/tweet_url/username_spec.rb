require 'spec_helper'

describe TweetUrl::Username do
  describe '.username' do
    let (:username) { 'i05' }
    describe 'takes string URL and extract username' do
      subject { TweetUrl::Username::username("https://twitter.com/#{username}/status/658113992410292224") }
      it { is_expected.to eq username }
    end
  end
end
