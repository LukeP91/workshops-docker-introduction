FROM ruby:2.6.3

WORKDIR /app

COPY Gemfile* ./
RUN gem install bundler && bundle install

COPY . ./

ARG MESSAGE

ENV HELLO=$MESSAGE

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "main.rb"]
