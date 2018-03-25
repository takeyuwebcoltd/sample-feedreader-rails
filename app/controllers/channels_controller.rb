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
    @channel = Channel.find(params[:channel_id])
    channel = RSS::Parser.parse(@channel.url).channel
    @channel.update(title: channel.title, description: channel.description)

    channel.items.each do |fetch|
    item = @channel.items.build
      unless Item.exists?(title: fetch.title, link: fetch.link, pubdate: fetch.pubDate)
        item.update(title: fetch.title, link: fetch.link, pubdate: fetch.pubDate)
      end
    end
    redirect_to channels_path
  end

  private
  def channel_params
    params.require(:channel).permit(:url)
  end

end
