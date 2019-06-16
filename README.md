# ilyapt_infra
## ilyapt Infra repository

[![Build Status](https://travis-ci.com/otus-devops-2019-05/ilyapt_infra.svg?branch=master)](https://travis-ci.com/otus-devops-2019-05/ilyapt_infra)

### Выполнено ДЗ №2
- Настроена интеграция со Slack и Travis-CI
- Пофиксен баг для прохождения тестов
*Для интеграции между Slack и Travis-CI на OSX **travis** ставится через **brew**, через gem падает с ошибкой*
```
$ sudo brew install travis
```
*Тк пользуюсь двухфакторной аутентификацией, travis запросил код github-а*
