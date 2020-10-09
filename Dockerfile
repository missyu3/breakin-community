FROM ruby:2.6.5

RUN apt-get update && \
    apt-get install -y nodejs vim yarn --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# chromeの追加
RUN apt-get update  && rm -rf /var/lib/apt/lists/* && apt-get install --no-install-recommends -y unzip && \
    CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    chown root:root ~/chromedriver && \
    chmod 755 ~/chromedriver && \
    mv ~/chromedriver /usr/bin/chromedriver && \
    sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update && rm -rf /var/lib/apt/lists/* && apt-get install --no-install-recommends -y google-chrome-stable \
    && rm -r /var/lib/apt/lists/*    

WORKDIR /breakin-community
COPY Gemfile Gemfile.lock /breakin-community/

RUN gem install bundler
RUN bundle install 