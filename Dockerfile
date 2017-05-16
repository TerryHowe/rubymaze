FROM ruby:2.4

WORKDIR /
RUN git clone https://github.com/TerryHowe/rubymaze.git
WORKDIR /rubymaze
RUN bundle install

EXPOSE 3000
ENTRYPOINT ["/rubymaze/run.sh"]
