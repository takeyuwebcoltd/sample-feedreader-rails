require 'rss'
# https://news.yahoo.co.jp/pickup/rss.xml
# https://rss-weather.yahoo.co.jp/rss/days/7320.xml
class ChannelsController < ApplicationController
  before_action :set_channel,only:[:new, :fetch_items]

  def index
    @channels = Channel.all
  end

  def new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      @channel.items_save(@channel.id)
      redirect_to channels_path
    else
      render 'new'
    end
  end

  def fetch_items
    @channel.items_save(params[:channel_id])
    redirect_to channels_path
  end

  private
  def channel_params
    params.require(:channel).permit(:url)
  end

  def set_channel
    @channel = Channel.new
  end

end
