require 'rss'
# https://news.yahoo.co.jp/pickup/computer/rss.xml
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
    fetch_channel = RSS::Parser.parse(channel.url).channel

    channel.title = fetch_channel.title
    channel.description = fetch_channel.description
    channel.changed?
      channel.save

    if channel.items.first == nil
      fetch_channel.items.each.map do |fetch_item|
        item = channel.items.build
        item.title = fetch_item.title
        item.link = fetch_item.link
        item.pubdate = fetch_item.pubDate
        item.save
      end
    else
      item = channel.items.first
      fetch_item = fetch_channel.items.first
        item.title = fetch_item.title
        item.link = fetch_item.link
        item.pubdate = fetch_item.pubDate
        item.changed?
          item.save
    end
    redirect_to channels_path
  end

  private
  def channel_params
    params.require(:channel).permit(:url)
  end

end
