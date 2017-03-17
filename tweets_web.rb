# encoding: utf-8

require 'sinatra'
require_relative 'tweets.rb'

class TweetsWeb < Sinatra::Base
  before do
    content_type :json
    @tweets = Locaweb::Tweets.new
  end

  get '/most_relevants' do
    @tweets.most_relevants
  end

  get '/most_mentions' do
    @tweets.most_mentions
  end
end
