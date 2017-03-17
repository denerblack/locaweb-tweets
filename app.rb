# encoding: utf-8

require 'sinatra'
require_relative 'tweets.rb'

class App < Sinatra::Base
  before do
    #content_type :json
    @tweets = Locaweb::Tweets.new
  end

  get '/' do
    @most_relevants = JSON(@tweets.most_relevants)
    erb :index#, layout: :layout
  end

  get '/most_relevants' do
    @most_relevants = @tweets.most_relevants
  end

  get '/most_mentions' do
    @tweets.most_mentions
  end
end
