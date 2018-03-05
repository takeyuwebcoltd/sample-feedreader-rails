class FeedsController < ApplicationController
  def index
    @feed = Feed.rss
  end
end
