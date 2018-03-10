require 'rss'
# https://news.yahoo.co.jp/pickup/computer/rss.xml
class FeedsController < ApplicationController
  def index
    @channel = Feed.channel
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to feeds_path
    else
      render 'new'
    end
  end

  private
  def feed_params
    params.require(:feed).permit(:url)
  end
end
