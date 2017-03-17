# encoding: utf-8

require 'sinatra'
require_relative 'tweets.rb'

class App < Sinatra::Base
  before do
    @tweets = Locaweb::Tweets.new
  end

  get '/' do
    @most_relevants = JSON(@tweets.most_relevants)
    @most_mentions  = JSON(@tweets.most_mentions)
    erb :index
  end
end
