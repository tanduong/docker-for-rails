FROM ruby:2.3.3
ENV TERM=xterm
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /src
WORKDIR /src
ADD ./src/Gemfile /src/Gemfile
ADD ./src/Gemfile.lock /src/Gemfile.lock
COPY ./src/lib/engines/ /src/lib/engines/
RUN bundle install
ADD ./src /src
