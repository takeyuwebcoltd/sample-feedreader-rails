class Channel < ApplicationRecord

  has_many :items, dependent: :destroy
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/

  def update_items
    source_channel = RSS::Parser.parse(url).channel
    assign_attributes(title: source_channel.title, description: source_channel.description)
    save if changed?

    source_channel.items.each do |source_item|
      item = items.find_or_initialize_by(title: source_item.title)
      item.assign_attributes(link: source_item.link, pubdate: source_item.pubDate)
      item.save if item.changed?
    end
  end

end
