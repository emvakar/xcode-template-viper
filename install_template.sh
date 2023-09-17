#!/bin/bash

# URL репозитория
REPO_URL="https://github.com/emvakar/xcode-template-viper.git"

# Путь к папке шаблонов Xcode
TEMPLATES_DIR="${HOME}/Library/Developer/Xcode/Templates"

# Проверка существования папки. Если папки нет, то создать ее.
if [ ! -d "${TEMPLATES_DIR}" ]; then
    mkdir -p "${TEMPLATES_DIR}"
fi

# Клонирование репозитория во временную папку
TEMP_DIR=$(mktemp -d)
git clone "${REPO_URL}" "${TEMP_DIR}"

# Копирование содержимого из временной папки в папку шаблонов Xcode
cp -R "${TEMP_DIR}"/* "${TEMPLATES_DIR}/"

# Удаление временной папки
rm -rf "${TEMP_DIR}"

echo "Шаблон успешно установлен!"
