#vagrant puppet lamp#
A minimal LAMP setup created with Vagrant, Puppet, and Hiera.

##What's inside?##
* Ubuntu Trusty 64
* PHP
    * Composer
    * PHPUnit
    * fpm
    * Mysql, json, and intl extensions
* MySQL
    * All default settings
* Apache
    * mod_fastcgi
    * mod_rewrite
    * mod_actions
* Nodejs
    * npm

##Setup##
Just clone or download this repositoy and run **vagrant up**. Run **vagrant ssh** to easily login to the box.

## Adding Virtual Hosts ##
1. Open manifests/apache.pp
2. Copy the example vhost entry
3. Change the docroot and the name
4. Run **vagrant provision** in the repo root

Example;
```
apache::vhost { 'example2.dev':
  port    => '80',
  docroot => '/var/www/example2',
  custom_fragment => 'AddType application/x-httpd-php .php',
  override => 'All',
  docroot_owner => 'vagrant',
}
```

##Adding PHP Extensions/Settings##
You can manage all of PHP's settings in the php configuration file located at manifests/config/php.yaml. I've left some comments and a link to the mayflower php module documentation.

##Managing MySQL##
There are a couple of ways to connect to the MySQL server. You can use a program like Sequal Pro, or you can interact via the command line by running **sudo mysql**. 

###Using Sequal Pro###
1. Run **vagrant ssh-config** in the repo root.
2. Use the printed information to connect via an *SSH* connection. The default MySQL username is 'root'. Leave the password blank.

![alt text](http://i.imgur.com/QwTbWBF.png)

