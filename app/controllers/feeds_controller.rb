require 'rss'

class FeedsController < ApplicationController
  def index
    url = Feed.find(1).url
    @feed = RSS::Parser.parse(url)
  end

  def new
    @feed = Feed.new
  end

  def create
    Feed.create(feed_params)
    redirect_to feeds_path
  end

  private
  def feed_params
    params.require(:feed).permit(:url)
  end
end
