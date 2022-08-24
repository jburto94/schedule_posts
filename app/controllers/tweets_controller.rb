class TweetsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.create(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet has been successfully scheduled"
    else
      render :new
    end    
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Tweet has been successfully updated"
    else
      render :edit
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to tweets_path, notice: "Tweet has been successfully deleted"
    else
      redirect_to tweets_path, alert: "We are sorry, something went wrong when deleting your tweet"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end

  def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
  end
end