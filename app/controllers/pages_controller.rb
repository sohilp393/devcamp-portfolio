class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills =  Skill.all
  end

  def about
  end

  def contact
  end

  def tech_news
    @tweets = []
    @tweets <<  "Kudos to all those working round the clock, across the nation, to ensure India’s energy needs are met."
    @tweets  << "Go Fun The World. Get 9GAG app for the latest memes, gifs and videos: http://9gag.com/apps. Contact us: 9gag@9gag.com"
    #@tweets = SocialTool.twitter_search 
  end
end
