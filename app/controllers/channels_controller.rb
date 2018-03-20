require 'rss'
# https://news.yahoo.co.jp/pickup/computer/rss.xml
# https://rss-weather.yahoo.co.jp/rss/days/7320.xml
class ChannelsController < ApplicationController
  def index
    @channels = Channel.channels
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

  private
  def channel_params
    params.require(:channel).permit(:url, :title, :description, items_attributes: [:title, :link, :pubdate])
  end

end
