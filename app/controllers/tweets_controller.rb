class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all.page(params[:page])
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @comment = current_user.comments.build
    @comments = @tweet.comments
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render "new"
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  def search
    if params[:body]. present?
      @tweets = Tweet.where('body LIKE ?', "%#{params[:body]}%")
    else
      @tweets = Tweet.none
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :image)
  end
end
