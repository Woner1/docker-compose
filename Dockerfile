FROM ruby:2.4.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /docker-compose
WORKDIR /docker-compose
COPY Gemfile /docker-compose/Gemfile
COPY Gemfile.lock /docker-compose/Gemfile.lock
RUN bundle install
COPY . /docker-compose

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]