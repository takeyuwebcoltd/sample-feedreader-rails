class Channel < ApplicationRecord
  attr_accessor :channel

  has_many :items, dependent: :destroy
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/

  def items_save
    source_channel = RSS::Parser.parse(self.url).channel
    self.assign_attributes(title: source_channel.title, description: source_channel.description)
    self.save if self.changed?

    items = self.items
    source_channel.items.each do |source_item|
      item = items.find_or_initialize_by(title: source_item.title)
      item.assign_attributes(link: source_item.link, pubdate: source_item.pubDate)
      item.save if item.changed?
    end
  end

end
