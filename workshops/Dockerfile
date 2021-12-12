# version pinned
FROM ruby:3.0.1

# run update install together. Less layers, cache will work properly
# pin lib versions
# clean uncecessary things. Smaller image, smaller attack surface
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

# creates workdir if doesn't exists
WORKDIR /myapp

# copy only mimimal list of files needed to setup app
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

# keep envs and expose as low as possible, as they are fast to run and can easily bust cache
ARG MESSAGE
ENV HELLO=$MESSAGE

# add expose so people know which ports they need to bind. Avoid <1024 so you don't need to run as a root
EXPOSE 3000

# Prefer the exec form over the shell form for a performance reasons
CMD ["rails", "server", "-b", "0.0.0.0"]
