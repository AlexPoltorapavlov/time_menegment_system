# Time Menegment System

Проект предназначен для отслеживания времени, затраченного на выполнение ваших задач и проектов.

## Требования

- Ruby версии `3.0.2`
- Rails версии `7.1`
- PostgreSQL
- Node.js версии `20.12`
- Yarn

## Установка

1. Клонируйте репозиторий на свою машину:
По протоколу HTTP
```bash
git clone https://gitlab.edu.rnds.pro/poltorapavlov.iskander/time_menegment_system.git
```
Или по протоколу SSH:
```bash
git clone git@gitlab.edu.rnds.pro:poltorapavlov.iskander/time_menegment_system.git
```

2. Установите необходимые для работы гемы:
```bash
bundle install
```

3. Установите зависимости JavaScript
```bash
yarn install
```

4. Настройте базу данных.

Измените настройки в config/database.yml для вашей локальной среды.

5. Создайте и настройте базу данных:
```bash
rails db:create
rails db:migrate
```

6. Загрузите начальные данные в базу данных (если есть seed данные):

```bash
rails db:seed
```

## Запуск проекта:

1. Запустите сервер Rails
```bash
rails server
```
2. Перейдите в браузер и откройте http://localhost:3000.
