require 'test_helper'

class ChannelTest < ActiveSupport::TestCase

  test "should save channel with valid url" do
    channel = Channel.new(url: "https://rss-weather.yahoo.co.jp/rss/days/7320.xml")
    assert channel.valid?
  end

  test "should not save feed when scheme is not http/https" do
    channel = Channel.new(url: "javascript:alert('XSS');//http://shiraishi.jp/")
    assert channel.invalid?
  end

  test "should not save channel without url" do
    channel = Channel.new
    assert channel.invalid?
  end
end
