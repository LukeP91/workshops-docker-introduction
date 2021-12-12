FROM ruby:3.0.1

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
  /var/lib/apt \
  /var/lib/cache \
  /var/lib/dpkg \
  /var/lib/apt/lists/* \
  /var/lib/log

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . ./

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
