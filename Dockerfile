# syntax = docker/dockerfile:1

# Используем базовый образ Ruby
FROM ruby:3.0.2-slim

# Устанавливаем рабочую директорию
WORKDIR /time_menegment_system

# Устанавливаем необходимые пакеты
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential \
    git \
    libvips \
    pkg-config \
    libpq-dev \
    nodejs && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Копируем Gemfile и Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Устанавливаем зависимости
RUN bundle install --without development test

# Копируем все файлы приложения
COPY . .

# Предварительная компиляция assets
RUN bundle exec rails assets:precompile
# Открываем порт 3000
EXPOSE 3000

# Команда для запуска сервера
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0"]