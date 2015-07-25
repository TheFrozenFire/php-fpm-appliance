```
docker build -t php-fpm-appliance .
docker run -i -v /path/to/project:/application -t php-fpm-appliance /warm.sh
```
