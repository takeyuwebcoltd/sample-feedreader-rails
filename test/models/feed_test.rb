require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  test  "url validate" do
    feed_true = Feed.new(url: "https://rss-weather.yahoo.co.jp/rss/days/7320.xml")
    feed_false = Feed.new(url: "javascript:alert('XSS');//http://shiraishi.jp/")
    feed_blank = Feed.new

    assert feed_true.valid?
    assert feed_false.invalid?
    assert_not feed_blank.save
  end
end
