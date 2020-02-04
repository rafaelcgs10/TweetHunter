class HashtagsController < ApplicationController
  def index
    @hashtags = Hashtag.all
  end

  def new
    @hashtag = Hashtag.new
  end

  def show
    @hashtag = Hashtag.find(params[:id])
    @tweets = Tweet.where(hashtag: @hashtag.hashtag).order(date: :desc)
  end

  def destroy
    @hashtag = Hashtag.find(params[:id])
    @tweets = Tweet.where(hashtag: @hashtag.hashtag)
    @hashtag.destroy
    redirect_to hashtags_path
    DeleteTweetsJob.perform(@tweets)
  end

  def create
    @hashtag = Hashtag.new(hastag_params)
    if @hashtag.save
      TweetSearchJob.search_hashtag(@hashtag, 20)
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
