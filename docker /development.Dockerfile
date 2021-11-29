FROM ruby:2.6.3

RUN bundle config --global frozen 1
RUN mkdir -p /app

WORKDIR /app

COPY . ./
RUN gem install bundler && bundle install


ARG MESSAGE

ENV HELLO=$MESSAGE

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "main.rb"]
