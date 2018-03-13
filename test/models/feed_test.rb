require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  
  test "should save feed with valid url" do
    feed = Feed.new(url: "https://rss-weather.yahoo.co.jp/rss/days/7320.xml")
    assert feed.valid?
  end

  test "should not save feed when scheme is not http/https" do
    feed_false = Feed.new(url: "javascript:alert('XSS');//http://shiraishi.jp/")
    assert feed_false.invalid?
  end

  test "should not save feed without url" do
    feed_blank = Feed.new
    assert feed_blank.invalid?
  end
end
