#!/bin/bash
cd /code
rm -f /code/tmp/pids.server.pid
bundle exec crono start
bundle exec puma -C /code/config/puma.rb
