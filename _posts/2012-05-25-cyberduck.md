---
title: "Cyberduck"
description: "Подключение к облачному хранилищу с помощью Cyberduck"
layout: article
category: Облачное хранилище
---



__Cyberduck__ - проект с открытым исходным кодом. Он представляет из себя клиент для работы с FTP, SFTP, WebDAV, Cloud Files, Google Docs, и Amazon S3. Клиент работает под Mac OS X и Windows (начиная с версии 4.0). Есть поддержка FTP/TLS, используя AUTH TLS, а также синхронизации каталогов. Работа с Cyberduck ведется через графический интерфейс.



Использование Cyberduck для работы с Cloud Storage
--------------------------------------------------

Для подключения к [Cloud Storage](/cloud-storage/cloudstorage.html) через Cyberduck, необходимо выполнить следующие действия:

Добавить новую закладку, в качестве профиля выбрать __Swift (OpenStack Object Storage)__

Заполнить необходимые данные для подключения:

> Сервер: api.clodo.ru
> 
> Порт: 443
> 
> Хранилище: storage_xxxxxx_x
>
> Ключ для доступа: ключ, генерирующийся при создании хранилища. Вы всегда можете сгенерировать его снова, перейдя во вкладку "Cloud Storage" в панели управления.

![cyberduck](/images/cloudstorage/cyberduck/cyberduck.png "cyberduck")