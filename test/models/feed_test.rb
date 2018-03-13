require 'test_helper'

class FeedTest < ActiveSupport::TestCase

  test "should save feed with valid url" do
    feed = Feed.new(url: "https://rss-weather.yahoo.co.jp/rss/days/7320.xml")
    assert feed.valid?
  end

  test "should not save feed when scheme is not http/https" do
    feed = Feed.new(url: "javascript:alert('XSS');//http://shiraishi.jp/")
    assert feed.invalid?
  end

  test "should not save feed without url" do
    feed = Feed.new
    assert feed.invalid?
  end
end
