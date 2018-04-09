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
      Channel.new.items_save(@channel)
      redirect_to channels_path
    else
      render 'new'
    end
  end

  def fetch_items
    channel = Channel.find(params[:channel_id])
    Channel.new.items_save(channel)
    redirect_to channels_path
  end

  private
  def channel_params
    params.require(:channel).permit(:url)
  end

end
