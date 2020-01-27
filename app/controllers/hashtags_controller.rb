class HashtagsController < ApplicationController
  def index
    @hashtags = Hashtag.all
  end

  def show
    @hashtag = Hashtag.find(params[:id])
  end

  def create
    @hashtag = Hashtag.new(hastag_params)
    if @hashtag.save
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
