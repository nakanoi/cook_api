FROM ruby:2.6.2
RUN apt-get update -qq && \
	apt-get install -y build-essential libpq-dev nodejs vim
RUN mkdir /code
WORKDIR /code
COPY Gemfile /code/Gemfile
COPY Gemfile.lock /code/Gemfile.lock
RUN bundle install

COPY . /code
RUN ["/bin/bash", "-c", "source /code/.env"]
COPY entrypoint.sh /usr/bin/
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["sh", "run.sh"]
