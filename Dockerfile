FROM ruby:3.0.3
ENV TZ Asia/Tokyo

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update -qq \
    && apt-get install -y default-mysql-client \
    && apt-get install -y nodejs \
    && npm install -g yarn

RUN mkdir /myapp
WORKDIR /myapp

ENV PATH="/usr/bin:${PATH}"

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]