xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "@#{@user.login}'s home twitter timeline"

    @tweets.each do |tweet|
      xml.item do
        xml.title title(tweet)
        xml.pubDate tweet.created_at.to_s
        xml.link link_to(tweet)
        xml.guid tweet.id
        xml.description tweet_text(tweet)
      end
    end
  end
end
