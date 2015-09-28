## What is this?
This repo serves as a base LAMP box managed by Vagrant, Puppet, and Hiera. It is very minimal, and only provides the
essentials required for a PHP environment. Here's what's inside;

* PHP (Latest available version)
  * Composer
  * Pear
  * PHPunit
  * Extensions
    * Mysql
    * Curl
    * Intl
    * gd
  * FPM
* Apache
  * Rewrite
  * Fastcgi
  * actions
* MySQL
  * All default dettings

## Why?
It's become common for each project to have its own development environment. I wanted to create something that I could
use to minimize the amount of boilerplate required to get a baseline LAMP setup running. You can drop this repo into 
the root of your project and have a solid, functional, and flexible server running in minutes.

## How do I use this?
### Dependencies
You'll need to have [Ruby installed](https://www.ruby-lang.org/en/documentation/installation/). Its comes bundled with most Unixy operating systems.

This repo utalizes [Librarian Puppet](https://github.com/rodjek/librarian-puppet) - a module manager for Puppet.
Like any module/package manager, it allows you to keep your vendor files separated from your own code while also
giving you the ability to lock down version dependencies. You'll need to install it before you can use this repo: ``` gem install librarian-puppet ```

### Setup instructions
Once you've downloaded the project, place it in a folder in your project root (this is obviously not required, but
it's how I like to do things). In your CLI, make sure you're in the same directory as the Vagrantfile, and run this
command: ``` librarian-puppet install ```. This will install the required Puppet modules. Once that's finished, run ``` vagrant up ```.




