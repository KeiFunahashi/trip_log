class NewsController < ApplicationController
  def new
    @news = News.new
  end
  def create
    News.create(news_params)
  end
  
  private
  def news_params
    params.require(:news).permit(:newsimage, :newstitle, :newscontent)
  end
end
