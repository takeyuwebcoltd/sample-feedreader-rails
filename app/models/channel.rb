class Channel < ApplicationRecord
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items

  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/

  def self.channels
    all.map { |channel| RSS::Parser.parse(channel.url).channel }
  end
end
