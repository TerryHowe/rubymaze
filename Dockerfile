FROM ruby:3.4-slim

# build-essential + libmysqlclient for the mysql2 native extension,
# nodejs as the ExecJS runtime for uglifier/coffee-script asset compilation.
RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential default-libmysqlclient-dev pkg-config nodejs \
      && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_WITHOUT="development:test" \
    RAILS_SERVE_STATIC_FILES=1 \
    RAILS_LOG_TO_STDOUT=1

WORKDIR /rubymaze

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rake assets:precompile

EXPOSE 4000
ENTRYPOINT ["/rubymaze/run.sh"]
