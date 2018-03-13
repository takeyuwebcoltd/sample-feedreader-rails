require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  def feed_true
    @feed ||= Feed.new(
    url: "https://rss-weather.yahoo.co.jp/rss/days/7320.xml"
    )

  end

  def feed_false
    @feed ||= Feed.new(
    url: "javascript:alert('XSS');//http://shiraishi.jp/"
    )
    @feed_blank ||= Feed.new(
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
