require 'sinatra'
require 'rubygems'
require 'twitter'
require 'debugger'

class TwitterFetcher < Sinatra::Base

  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      #debugger
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  # debugger
  # def self.get_trends(woeid)
  #   trends = helpers.client.trends(woeid) #NYC trends
  #   trends.collect {|t| t.name}
  # end

end