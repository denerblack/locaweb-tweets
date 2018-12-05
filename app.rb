# encoding: utf-8

require 'sinatra'
require 'sinatra/json'
require_relative 'tweets.rb'

class App < Sinatra::Base
  before do
    @tweets = Locaweb::Tweets.new
  end

  get '/' do
    @most_relevants = @tweets.most_relevants
    @most_mentions  = @tweets.most_mentions
    erb :index
  end

  get '/most_relevants' do
    json @tweets.most_relevants
  end

  get '/most_mentions' do
    json @tweets.most_mentions
  end
end
