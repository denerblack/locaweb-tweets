require 'rspec'
require_relative '../tweets.rb'
require 'webmock/rspec'

RSpec.describe Locaweb::Tweets do
  let (:tweets) { tweets = Locaweb::Tweets.new }
  before(:each) { stubs }
  describe 'most relevants' do
    it 'lists most relevants' do
      most_relevants = JSON tweets.most_relevants
      puts most_relevants
      expect(most_relevants.count).to eq 3
      expect(most_relevants[0].keys).to eq(['user', 'tweet'])
    end
  end

  describe 'most_mentions' do
    it 'lists most mentions' do
      most_mentions = tweets.most_mentions
      expect(JSON(most_mentions).keys).to eq(['berneice_osinski', 'jazmyne_murray', 'terry_mr_schmeler'])
    end
  end

  def stubs
    response = File.open("#{Dir.pwd}/spec/response.json").read
    stub_request(:get, 'http://tweeps.locaweb.com.br/tweeps').with(headers: { 'Username' => 'dener.wilian@gmail.com' }).to_return(body: response)

  end
end
