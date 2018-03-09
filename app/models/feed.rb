require 'rss'

class Feed < ApplicationRecord
  validates :url, presence: true

  def self.channel
    url = Feed.first.url
    rss = RSS::Parser.parse(url)
    rss.channel
  end
end
