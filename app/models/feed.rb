class Feed < ApplicationRecord
  has_one :channel, dependent: :destroy
  accepts_nested_attributes_for :channel

  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/

  def self.channels
    all.map { |feed| RSS::Parser.parse(feed.url).channel }
  end
end
