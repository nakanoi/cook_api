#!/bin/bash
cd /code
rm -f /code/tmp/pids.server.pid
bundle exec rails db:migrate
bundle exec crono start
bundle exec puma -C /code/config/puma.rb
