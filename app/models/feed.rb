class Feed < ApplicationRecord
  validates :url, presence: true

  def self.channel
    rss = RSS::Parser.parse(first.url)
    rss.channel
  end
end
