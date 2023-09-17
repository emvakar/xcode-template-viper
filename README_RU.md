# VIPER template for Xcode (15.0.0)

[English :us:](./README.md)

:star2: Если вам понравился наш проект, пожалуйста, **поставьте нам звезду**! Это поможет другим разработчикам узнать о нашей работе и оценить её. Спасибо!

Этот шаблон предназначен для тех, кто хочет быстро начать разработку проекта на Xcode, используя VIPER архитектуру. 
Уберите рутину настройки проекта с помощью этого готового шаблона.

### Особенности

- Автоматическая настройка проекта при его создании.
- Экономия времени благодаря предустановленным конфигурациям.
- Генерация следующих файлов и компонентов при создании проекта:
    - Gemfile
    - fastlane
    - Rambafile
    - Базовые классы
    - Extensions
    - Helpers


### Установка
Для установки шаблона выполните следующую команду. Шаблон будет установлен в директорию `~/Library/Developer/Xcode/Templates`.

```shell
curl -sSL https://raw.githubusercontent.com/emvakar/xcode-template-viper/main/install_template.sh | bash
```

### Использование

1. Создайте новый проект через Xcode GUI.
2. Выберите категорию `iOS`.
3. Пролистайте вниз до раздела `Others` и выберите шаблон `AppVIPER`.

### Зависимости

Мы используем Swift Package Manager для управления зависимостями. 
Наш шаблон требует наличия следующих базовых зависимостей:

- SnapKit `https://github.com/SnapKit/SnapKit.git`

### Generabma

Generamba — наш инструмент для генерации кода.

Установка последних шаблонов:

```shell
generamba  template  install
```

Создание нового модуля для разработки:

```shell
generamba  gen  MODULE_NAME  ios_viper
```