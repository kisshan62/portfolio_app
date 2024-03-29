FROM ruby:2.5.3

# リポジトリを更新し依存モジュールをインストール
RUN apt update && apt install -y \
    build-essential
# nodejs v14系インストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt install -y nodejs

# ルート直下にwebappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
ENV APP_ROOT /webapp
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . $APP_ROOT

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

# 以下の記述があることでnginxから見ることができる
VOLUME $APP_ROOT/public
VOLUME $APP_ROOT/tmp

# production
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# 
CMD /bin/sh -c "rm -f tmp/pids/server.pid && bundle exec puma -C config/puma.rb"
