FROM ruby:2.5.1-slim-stretch

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install git -y

RUN mkdir /app
WORKDIR /app

ADD Gemfile Gemfile.lock /app/
ADD . /app

RUN bundle install -j 8 --system
