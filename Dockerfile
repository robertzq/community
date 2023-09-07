# 使用官方 Ruby 镜像作为基础镜像
FROM ruby:2.7

# 安装必要的依赖库
RUN apt-get update -qq && apt-get install -y build-essential patch ruby-dev libffi-dev zlib1g-dev liblzma-dev

# 安装 Bundler
RUN gem install bundler

# 设置工作目录
WORKDIR /usr/src/app

# 将当前目录的内容复制到容器中的 /usr/src/app 目录
COPY . /usr/src/app

# 安装项目依赖
RUN bundle install

# 指定容器将监听的端口
EXPOSE 4000

# 设置启动命令
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
