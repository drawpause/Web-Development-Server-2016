# Web-Development-Server-2016
A minimalist, low-memory-footprint Vagrant setup for a basic LEMP (Linux, nginx, MySQL and PHP) box.
Provision is done by a simple shell script instead of adding extra layers of "helper" apps.

Includes [Mailcatcher](http://mailcatcher.me/) so you don't spam your clients by accident.

# Installing
```
git clone git@github.com:drawpause/Web-Development-Server-2016.git webserver
cd webserver
vagrant up
```

The default location is http://192.168.0.199/.
