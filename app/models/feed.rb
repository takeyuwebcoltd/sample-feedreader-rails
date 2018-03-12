class Feed < ApplicationRecord
  validates :url, presence: true

  #def self.channel
    #rss = RSS::Parser.parse(first.url)
    #rss.channel
  #end

  def self.channels
    all.map do |feed|
      rss = RSS::Parser.parse(feed.url)
      rss.channel
    end
  end
end
