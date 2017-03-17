require 'uri'
require 'net/http'
require 'json'

module Locaweb
  class Tweets
    URI = URI('http://tweeps.locaweb.com.br/tweeps')

    def most_relevants
     JSON sort(eligibles).map { |tweet| fields(tweet) }
    end

    def most_mentions
      mentions = sort(eligibles).group_by do |tweet|
        tweet['user']['screen_name']
      end

      mentions.each do |key, value|
        mentions[key] = sort(value).map! { |tweet| fields(tweet) }
      end
      JSON mentions
    end

    private

    def eligibles
      @eligibles ||= build_eligibles
    end

    def build_eligibles
      all['statuses'].select do |tweet|
        reply_to_user_id = !tweet['in_reply_to_user_id'].eql?(42)
        user_mentions = tweet['entities']['user_mentions'].any? do |mention|
          mention['id'].eql?(42)
        end
        reply_to_user_id && user_mentions
      end
    end

    def all
      request = Net::HTTP::Get.new(URI)
      request.initialize_http_header('Username' => 'dener.wilian@gmail.com')
      response = Net::HTTP.start(URI.hostname, URI.port) do |http|
        http.request(request)
      end
      JSON.parse(response.body)
    end

    def sort(tweets)
      tweets.sort_by do |tweet|
        [
          (-tweet['user']['followers_count']),
          (-tweet['retweet_count']),
          (-tweet['favorite_count'])
        ]
      end
    end

    def fields(tweet)
      result = {}
      result[:user] = {}
      result[:user][:profile] = {
        screen_name: tweet['user']['screen_name'],
        url: tweet['user']['profile_image_url']
      }
      result[:user][:info] = {
        followers_count: tweet['user']['followers_count']
      }
      result[:tweet] = {
        content: tweet['text'],
        date: tweet['created_at'],
        retweet_count: tweet['retweet_count'],
        favorite_count: tweet['favorite_count']
      }
      result
    end
  end
end
