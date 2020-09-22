FROM ruby:latest
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    node.js \
    yarn

WORKDIR /breakin-community
COPY Gemfile Gemfile.lock /breakin-community/
RUN bundle install