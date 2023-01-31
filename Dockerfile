FROM ruby:2.7.5

WORKDIR /app
COPY . .

RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

RUN rm -f tmp/pids/server.pid
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
