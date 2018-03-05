class Feed < ApplicationRecord
  def self.rss
    require "rss"
    url = "https://news.yahoo.co.jp/pickup/computer/rss.xml"
    RSS::Parser.parse(url)
  end
end
