FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /locaweb-tweets
WORKDIR /locaweb-tweets
COPY Gemfile /locaweb-tweets/Gemfile
COPY Gemfile.lock /locaweb-tweets/Gemfile.lock
RUN bundle install
ENV PORT 9292
EXPOSE 9292
