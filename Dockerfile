FROM ruby:latest

RUN apt-get update && \
    apt-get install -y nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /breakin-community
COPY Gemfile Gemfile.lock /breakin-community/

RUN gem install bundler
RUN bundle install 