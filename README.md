# minimalist-lemp
A minimalist, low-memory-footprint Vagrant setup for a basic LEMP (Linux, nginx, MySQL and PHP) box.
Provision is done by a simple shell script instead of adding extra layers of "helper" apps.

Includes:
- Official Ubuntu Server 14.04 LTS 32bit (Trusty Tahr)
- NGINX
- PHP5
- MySQL
- [Mailcatcher](http://mailcatcher.me/) so you don't spam your clients by accident.

# Installing
```
git clone git@github.com:drawpause/minimalist-lemp
cd webserver
vagrant up
```

The default location is http://192.168.0.199/.
