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


------------

### Домашнее задание №3
Есть как минимум три способа подключиться в одну команду ко внутреннему хосту:
- Используя ProxyJump: `ssh -i ~/.ssh/appuser -J appuser@35.210.183.22 appuser@10.132.0.3`
- Используя ProxyCommand: `ssh -i ~/.ssh/appuser -o ProxyCommand='ssh appuser@35.210.183.22 -W %h:%p' appuser@10.132.0.3`
- Используя команду на удаленном хосте: `ssh -i ~/.ssh/appuser -A -t appuser@35.210.183.22 ssh 10.132.0.3`

##### Дополнительное задание:
Для удобства, чтобы в консоли можно было осуществить подключение простой командой `ssh someinternalhost` необходимо прописать конфигурацию в `~/.ssh/config`:
```
Host someinternalhost
   User appuser
   HostName 10.132.0.3
   IdentityFile ~/.ssh/appuser
   ProxyJump appuser@35.210.183.22
 ```
или
```
Host someinternalhost3
   User appuser
   HostName 10.132.0.3
   IdentityFile ~/.ssh/appuser
   ProxyCommand ssh appuser@35.210.183.22 -W %h:%p
```
или
```
Host someinternalhost
   User appuser
   HostName 35.210.183.22
   IdentityFile ~/.ssh/appuser
   ForwardAgent yes
   RemoteCommand ssh 10.132.0.3
   RequestTTY yes
```

###Задание с VPN:
Конфигурация:
```
bastion_IP = 35.210.183.22
someinternalhost_IP = 10.132.0.3
```

#### Дополнительное задание:
Для того, чтобы веб-интерфейс VPN-сервера получил валидный сертификат достаточно присвоить ip-адресу сервера доменное имя (я привязал к **vpn.websta.pro**) и указать это доменное имя в настройках VPN-сервера: *Settings -> Lets Encrypt Domain*. Остальные действия по получению сертификата Pritunl сделал сам. В случае когда нет своего домена, можно использовать сервис [sslip.io](https://sslip.io) который создает домены вида 35-210-183-22.sslip.io для адреса 35.210.183.22, и которые можно использовать в качестве доменного имени.
