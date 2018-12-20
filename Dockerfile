# Choose ruby version, you can choose another version
FROM ruby:2.5.1

# Install apt based dependencies required to run Rails as well as RubyGems.
RUN apt-get update && apt-get install -y build-essential nodejs

# Configure the main working directory.
ENV APP_DIR /app
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

COPY . $APP_DIR

RUN bundle install

CMD rails server -b 0.0.0.0 -p 3000
