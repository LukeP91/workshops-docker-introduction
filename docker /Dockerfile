FROM ruby:2.6.3

RUN bundle config --global frozen 1
RUN mkdir -p /app

WORKDIR /app

COPY . ./
RUN gem install bundler && bundle install

EXPOSE 4567

ENV HELLO="Hello default env"

CMD ["bundle", "exec", "ruby", "main.rb"]
