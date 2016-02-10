# Gulp сборщик

### Для установки компонентов необходимо выполнить команды
```
npm install -g gulp bower
npm install
bower install
```

# Сборка файлов
### Необходимо отредактировать конфигурационный файл `gulp/config.yml` убрав комментарии с необходимых компонентов
Основные команды сборки:
* `gulp --tasks` - Список всех задач
* `gulp sass:bootstrap:compile` - Компиляция sass файлов Bootstrap согласно списку компонентов в конфигурационном файле
* `gulp sass:bootstrap:minify` - Тоже что и выше плюс минификация
* `gulp js:bootstrap` - Конкатенация компонентов Bootstrap, если те указаны в настройках
* `gulp js:bootstrap:minify` - Тоже что и выше плюс минификация
* `gulp js:vendor` - Конкатенация jQuery с компонентами Bootstrap, если те указаны в настройках
* `gulp js:vendor:minify` - Тоже что и выше плюс минификация
