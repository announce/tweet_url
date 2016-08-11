require 'spec_helper'

describe TweetUrl::Status do
  Status = TweetUrl::Status
  describe '.status_id' do
    let (:status_id) { 540897316908331009 }
    describe 'takes string URL and extract ID' do
      subject { Status::status_id("https://twitter.com/sferik/status/#{status_id}/") }
      it { is_expected.to equal status_id }
    end

    describe 'takes URL object and extract ID' do
      subject { Status::status_id(URI.parse("https://twitter.com/sferik/status/#{status_id}/")) }
      it { is_expected.to equal status_id }
    end

    describe 'takes integer ID and return ID' do
      subject { Status::status_id(status_id) }
      it { is_expected.to equal status_id }
    end

    describe 'takes URL followed by additional paths, and extract ID' do
      subject { Status::status_id("https://twitter.com/sferik/status/#{status_id}/photo/1/") }
      it { is_expected.to equal status_id }
    end

    describe 'takes plural style URL, and extract ID' do
      subject { Status::status_id("https://twitter.com/#!/sferik/statuses/#{status_id}/") }
      it { is_expected.to equal status_id }
    end

    describe 'takes irrelevant URL and return nil' do
      subject { Status::status_id('https://example.com/foo/bar/') }
      it { is_expected.to be_nil }
    end

    describe 'takes string ID and return nil' do
      subject { Status::status_id(status_id.to_s) }
      it { is_expected.to be_nil }
    end

    describe 'takes no ID URL, and return nil' do
      subject { Status::status_id('https://twitter.com/sferik/status/') }
      it { is_expected.to be_nil }
    end

  end

end
