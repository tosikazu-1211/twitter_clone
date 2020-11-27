class CommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.comments.build(comment_params)
    comment.tweet_id = tweet.id
    if comment.save
      redirect_to tweet_path(tweet.id)
    else
      redirect_to tweets_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
