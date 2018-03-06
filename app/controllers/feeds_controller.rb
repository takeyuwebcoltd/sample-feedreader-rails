class FeedsController < ApplicationController
  require 'rss'
  def index
    url = "https://news.yahoo.co.jp/pickup/computer/rss.xml"
    @feed = RSS::Parser.parse(url)
  end
end
