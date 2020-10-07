FROM ruby:2.6.5

RUN apt-get update && \
    apt-get install -y nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
WORKDIR /breakin-community
COPY Gemfile Gemfile.lock /breakin-community/

RUN gem install bundler
RUN bundle install 