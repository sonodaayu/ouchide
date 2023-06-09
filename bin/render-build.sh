#!/usr/bin/env bash
# exit on error
set -o errexit

rm -rf vendor/cache
bundle config set force_ruby_platform true
bundle config --local set path 'vendor/bundle'
bundle install
gem install nokogiri -v "1.14.3"
yarn install
yarn add esbuild
yarn build
bundle exec rake assets:precompile
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails assets:precompile
