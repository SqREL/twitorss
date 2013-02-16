module Sinatra
  module XMLHelper
    def title(tweet)
      t = "#{tweet.from_user}"
      t += " (retweet)" if tweet.retweet?
      t += " in reply to #{tweet.in_reply_to_screen_name}" if tweet.reply?
      t
    end

    def link_to(tweet)
      "https://twitter.com/#{tweet.from_user}/status/#{tweet.id}"
    end

    def tweet_text(tweet)
      Smartlinks.linkify tweet.full_text
    end
  end

  helpers XMLHelper
end
