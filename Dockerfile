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

# git設定
RUN git config --global alias.lol "log --graph --decorate --pretty=oneline --all --abbrev-commit"
RUN git config --global user.email "kishimotok@yahoo.co.jp"
RUN git config --global user.name "kisshan62"