require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  def feed_true
    @feed_true ||= Feed.new(
    url: "https://rss-weather.yahoo.co.jp/rss/days/7320.xml"
    )

  end

  def feed_false
    @feed_false ||= Feed.new(
    url: "javascript:alert('XSS');//http://shiraishi.jp/"
    )
    @feed_false ||= Feed.new(
    url: ""
    )
  end

  def test_valid
    assert feed_true.valid?
  end

  def test_invalid
    assert feed_false.invalid?
  end
end
