class TwitterSearch #The chef - does not know about the web or anything else -- just knows how to wrap the query in the client

  def initialize(query)
    @query = query
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "YOUR_CONSUMER_KEY"
      config.consumer_secret     = "YOUR_CONSUMER_SECRET"
      config.access_token        = "YOUR_ACCESS_TOKEN"
      config.access_token_secret = "YOUR_ACCESS_SECRET"
    end
  end

def tweets
  @client.search(@query).entries
end

end

# TwitterSearch.new("something").tweets
