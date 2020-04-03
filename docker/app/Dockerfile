# ------------------ Ruby Base ------------------
FROM ruby:2.5.3-alpine AS ruby-base

ENV APP_HOME="/rails_graphql" BUNDLE_PATH="$GEM_HOME"
ENV RAILS_ENV="production"

# Use virtual build-dependencies tag so we can remove these packages after bundle install
RUN apk update \
  && apk add --update --no-cache --virtual build-dependency \
  make gcc g++ qt-dev sqlite-dev

# ------------------ Cached Gems ------------------
FROM ruby-base AS cached-gems

# Cache the bundle install gems
COPY Gemfile* /cached-gems/
WORKDIR /cached-gems

RUN bundle install --no-cache --jobs 2 --retry 5 --without development test \
  && bundle clean --force \
  && rm -rf $BUNDLE_PATH/gems/*/.git \
  && rm -rf $BUNDLE_PATH/bundler/gems/*/.git \
  && rm -rf $BUNDLE_PATH/cache/*.gem \
  && find $BUNDLE_PATH/gems/ -name "*.c" -delete \
  && find $BUNDLE_PATH/gems/ -name "*.o" -delete

# Remove build dependencies and install runtime dependencies
RUN apk del build-dependency
RUN apk add --update --no-cache sqlite-dev nodejs tzdata

# ------------------ Production ------------------
FROM cached-gems AS production

WORKDIR $APP_HOME
COPY . .

RUN rm -rf log/* \
  && rm -rf node_modules tmp/cache \
  && mkdir -p tmp/pids/ \
  && touch tmp/pids/server.pid

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb", "-p", "3000"]
