require 'rss'
# https://news.yahoo.co.jp/pickup/rss.xml
# https://rss-weather.yahoo.co.jp/rss/days/7320.xml
class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to channels_path
    else
      render 'new'
    end
  end

  def fetch_items
    channel = Channel.find(params[:channel_id])
    source_channel = RSS::Parser.parse(channel.url).channel

    channel.assign_attributes(title: source_channel.title, description: source_channel.description)
    channel.save if channel.changed?

    items = channel.items
    source_channel.items.each do |source_item|
      item = items.find_or_initialize_by(title: source_item.title)
      item.assign_attributes(link: source_item.link, pubdate: source_item.pubDate)
      item.save if item.changed?
    end
    redirect_to channels_path
  end

  private
  def channel_params
    params.require(:channel).permit(:url)
  end

end
