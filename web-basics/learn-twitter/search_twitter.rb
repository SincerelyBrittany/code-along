require 'bundler'
Bundler.require

require_relative 'app/models/twitter_search'

puts "What would you like to search?"

query = gets.strip

tweets = TwitterSearch.new(query).tweets

tweets.each do |t|
  puts t.text
end
