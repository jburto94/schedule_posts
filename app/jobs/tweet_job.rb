class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    # Checks if tweet was updated to be published later than previously set
    return if tweet.publish_at > Time.current

    tweet.publish!
  end
end
