class HashtagsController < ApplicationController
  def index
    @hashtags = Hashtag.all
  end

  def show
    @hashtag = Hashtag.find(params[:id])
    @tweets = Tweet.where(hashtag: @hashtag.hashtag)
    puts @tweets.inspect
  end

  def destroy
    @hashtag = Hashtag.find(params[:id])
    @tweets = Tweet.where(hashtag: @hashtag.hashtag)
    @tweets.destroy_all
    @hashtag.destroy
    redirect_to hashtags_path
  end

  def create
    @hashtag = Hashtag.new(hastag_params)
    if @hashtag.save
      TweetSearchJob.search_hashtag(@hashtag.hashtag)
      redirect_to @hashtag
    else
      render 'new'
    end
  end

  private

  def hastag_params
    params.require(:hashtag).permit(:hashtag)
  end
end
