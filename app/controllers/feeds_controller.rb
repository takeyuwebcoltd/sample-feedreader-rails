require 'rss'

class FeedsController < ApplicationController
  def index
    url = "https://news.yahoo.co.jp/pickup/computer/rss.xml"
    @feed = RSS::Parser.parse(url)
  end
end
