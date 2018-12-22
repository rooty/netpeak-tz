Условия тестовое задание:
======
Необходимо написать сценарий (установки), который одновременно установит на 10 одинаковых серверов c CentOS7:
- php7 с модулями (bcmatch, imagik, pdo, amqp)
- phpmyadmin
- nginx
- mysql 5.6
- redis

Скрипт должен выполняться с вашего компьютера. Скрипт может быть написан на чём угодно,
можно использовать любые инструменты.
***
Для выполнения задания был подготовлен Ansible script.  
В процессе подготовки скрипта были переделаны 3 galaxy roles:
- mysql [![Ansible Galaxy](https://img.shields.io/badge/galaxy-rooty.mysql-blue.svg?style=flat)](https://galaxy.ansible.com/rooty/mysql)
- redis [![Ansible Galaxy](https://img.shields.io/badge/galaxy-rooty.redis-blue.svg?style=flat)](https://galaxy.ansible.com/rooty/redis)
- phpmyadmin [![Ansible Galaxy](https://img.shields.io/badge/galaxy-rooty.phpmyadmin-blue.svg?style=flat)](https://galaxy.ansible.com/rooty/phpmyadmin)

Так как они не работали с последними версиями Ansible или не выполнялся нужный функционал.

Тестирование было выполенно на vagrant sanbox окружении.  Прогон всего задания был выполнен на 1 потоке.
***
Для проверки этого задания необходимо выполнить начальную инициализацию и сам запуск деплоя.
Инициализаци:
```
make init
```
Эта команда выполнить установку `galaxy roles` в каталог `roles` посредством выполнения команды
```
ansible-galaxy install -f -p roles -r requirements.yml
```

Запуск деплоя:
```
make deploy
```

Эта команда проведет деплой всего что необходимо на сервера посредством команды
```
ansible-playbook -i inventory setup.yml
```

После деплоя можно проверить работу mysql, redis, nginx+php, phpmyadmin

Для проверки phpmyadmin можно запросить
```
links http://localhost/phpmyadmin
```
или использовать внешний адрес сервера
```
links http://<server-ip>/phpmyadmin
```
