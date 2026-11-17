#!/bin/bash
set -e

export SECRET_KEY_BASE="${SECRET_KEY_BASE:-$(bundle exec rails secret)}"
bundle exec rails db:migrate
exec bundle exec rails server -e production -b 0.0.0.0 -p 4000 "$@"
