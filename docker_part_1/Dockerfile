FROM ruby:2.6.3

WORKDIR /app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN gem install bundler && bundle install

COPY . ./

EXPOSE 4567

ENV HELLO="Hello default env"

CMD ["bundle", "exec", "ruby", "main.rb"]
