---
title: Exim
description: "Установка и настройка Exim для отправки почты"
layout: article
category: Email
---

* t
{:toc}




Установка необходимых пакетов
-----------------------------

Для начала нужно обновить кэш пакетов и установить Exim следующей командой:

	apt-get update && apt-get install exim4-daemon-light mailutils



Настройка Exim
--------------

Для настройки Exim наберите в консоли следующую команду:

	dpkg-reconfigure exim4-config

Появится окно с выбором типа общей почтовой конфигурации. Выберите пункт “интернет-сайт”.

![выберите пункт "интернет-сайт"](/images/mail/exim/exim-13.png "internet-site")

В следующем окне введите ваш домен полностью (напр.: mysuperdomain.ltd):

![введите домен](/images/mail/exim/exim-0.png "enter your domain")

При выборе IP-адресов, которые будет слушать Exim, стоит указать только “127.0.0.1”:

![введите IP](/images/mail/exim/exim-1.png "enter your IP-address")

В следующем окне нужно указать через точку с запятой все домены, которые указывают на ваш сервер:

![введите дополнительные домены](/images/mail/exim/exim-2.png "enter additional domains")

На следующих двух страницах мастера настройки нужно оставить поля пустыми:

![оставьте этот вопрос пустым](/images/mail/exim/exim-3.png "fill blank")
![оставьте этот вопрос пустым](/images/mail/exim/exim-4.png "fill blank")

На шаге с выбором сокращения DNS-запросов нужно выбрать “Нет”:

![выберите 'нет'](/images/mail/exim/exim-5.png "select No")

В следующем шаге выбираем пункт “Maildir...”, т.к. данный тип более распространён и имеет преимущества перед mbox:

![выберите Maildir](/images/mail/exim/exim-6.png "select Maildir")

На шаге выбора разделения конфигурации выберите “Нет”:

![выберите Нет](/images/mail/exim/exim-7.png "select No")

На последнем шаге нужно через пробел указать ящики, куда будет пересылаться почта для ‘root’ и ‘postmaster’:

![выберите Нет](/images/mail/exim/exim-7.png "enter emails")

После этого, окно мастера закроется и он перезагрузит Exim.

Для проверки работоспособности сервера выполните команду (замените “user@myrealmail.ltd” на свой реальный email):

	echo “Моё тестовое сообщение” | mail -s Topic user@myrealmail.lrd