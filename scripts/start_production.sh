#!/usr/bin/env bash

export RAILS_ENV=production

echo "Creating Database"
bundle exec rails db:create

echo "Migrating Database"
bundle exec rails db:migrate

# echo "Precompiling assets"
# bundle exec rake assets:precompile

echo "Starting app server"
bundle exec puma -C config/puma.rb -p 3000
