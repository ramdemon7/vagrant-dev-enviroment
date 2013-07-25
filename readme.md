# Web and Database Servers

A basic Ubuntu 12.04 Vagrant setup that defines two servers, a apache web server and a mysql database server
## Contents

* Web Server
    * Apache 2.2 - HTTP Web Server [Apache](https://www.apache.org)
    * Git 1.7 - Distributed Version Control System [Git](https://www.git-scm.com)
    * PHP 5.4 - Server-side scripting language [PHP](https://www.php.net)
    * Laravel 4 - PHP Framework [Laravel4](https://www.laravel.com)
    * Redis 2.6 - Key-Value Store [Redis](https://www.redis.io)
    * phpMyAdmin - PHP/MySQL Management Tool [phpMyAdmin](https://www.phpmyadmin.net)

* Database Server
    * MySQL 5.5 - Relational Database Management System [MySQL](https://www.mysql.com)
    * PostgreSQL 9.1 - Object Oriented Relational Database Management System [PostgreSQL](https://www.postgresql.org)

## Requirements

* VirtualBox - Free virtualization software [Downloads](https://www.virtualbox.org/wiki/Downloads)
* Vagrant - Tool for working with virtualbox images [Vagrant Home](https://www.vagrantup.com), click on 'download now link'
* Git - Source Control Management [Downloads](http://git-scm.com/downloads)

## Setup


* Clone this repository `git clone http://github.com/ramdemon7/WebDevVagrant.git`
* run `vagrant up` inside the newly created directory, this can take several minutes
* (the first time you run vagrant it will need to fetch the ubuntu 12.04 virtual box image)
* Vagrant will use puppet to provision the virtual box machine with the software listed above (this could take several minutes)
* To verify that the web server is running, you can open the http://192.168.33.10 address in the browser
* To verify that the db server is running, you can open the http://192.168.33.10/phpmyadmin in the brower and supply 'root' as the user, and 'root' as the password

## Usage

Basic information about the vagrant boxes

### Network
Both machines are in a private network 192.168.33.0

* Web Server ip '192.168.33.10'
* DB Server ip '192.168.33.11'

### Default MySQL/PostgreSQL Database

* User: root
* Password: root
* DB Name: database


### PHPmyAdmin

Accessible at http://192.168.33.10/phpmyadmin using MySQL access credentials above.

### Vagrant

Refer to the [Vagrant documentation](https://docs.vagrantup.com/v2/) to leran more
You can specify the name of the machine at the end of each command in order to apply this command to a specific machine.
The available names for the enviroments are:
* Web Server `web`
* Database Server `db`

#### Vagrant Commands
* `vagrant up <machine_name>` starts the virtual machine and provisions it
* `vagrant suspend <machine_name>` will essentially put the machine to 'sleep' with `vagrant resume` waking it back up
* `vagrant halt <machine_name>` attempts a graceful shutdown of the machine and will need to be brought back with `vagrant up`
* `vagrant ssh <machine_name>` gives you shell access to the virtual machine
* `vagrant destroy <machine_name>` removes all traces of the machine
