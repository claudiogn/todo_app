FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /todo_app
COPY Gemfile /todo_app/Gemfile
COPY Gemfile.lock /todo_app/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]