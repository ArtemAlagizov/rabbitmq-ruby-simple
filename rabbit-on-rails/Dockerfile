FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && gem install bundler
WORKDIR /
COPY . /
RUN bundle exec gem install bunny
