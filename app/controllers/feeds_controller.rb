class FeedsController < ApplicationController

  def index
    @feeds = Feed.find(:all)
  end

  def show
    @feed = Feed.find(params[:id])
  end

end
