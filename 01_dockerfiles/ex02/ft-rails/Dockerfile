FROM ruby:2.6.2

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install nodejs sqlite3 gem -y \
	&& gem install rails bundler rake

ONBUILD COPY app /opt/app
ONBUILD WORKDIR /opt/app
ONBUILD EXPOSE 3000
ONBUILD RUN bundle install
ONBUILD RUN bundle exec rake db:migrate
ONBUILD RUN bundle exec rake db:seed
