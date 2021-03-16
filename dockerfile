FROM ruby:2.7

RUN apt-get update -qq && apt-get install -qqy build-essential nodejs  && apt-get install -y npm && npm install -g yarn
#RUN npm install --global yarn
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/
#RUN gem install wdm
RUN bundle install

COPY . /app
 
# RUN rails db:migrate 
# RUN rails db:seed
EXPOSE 3000

CMD bundle exec rails server