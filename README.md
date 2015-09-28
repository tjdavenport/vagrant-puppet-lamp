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
You'll need to have [Ruby installed](https://www.ruby-lang.org/en/documentation/installation/). It comes bundled with most Unixy operating systems.

This repo utalizes [Librarian Puppet](https://github.com/rodjek/librarian-puppet) - a module manager for Puppet.
Like any module/package manager, it allows you to keep your vendor files separated from your own code while also
giving you the ability to lock down version dependencies. You'll need to install it before you can use this repo: ``` gem install librarian-puppet ```

### Setup instructions
Once you've downloaded the project, place it in a folder in your project root (this is obviously not required, but
it's how I like to do things). In your CLI, make sure you're in the same directory as the Vagrantfile, and run this
command: ``` librarian-puppet install ```. This will install the required Puppet modules. Once that's finished, run ``` vagrant up ```.

### Folder Syncing
The box is configured to automatically sync the directory above the Vagrantfile to /var/www. You can can change it in the Vagrantfile.

### Interacting with the VM
You can run ``` vagrant ssh ``` to quickly log into the machine. If you're trying to do something specific, check the [Vagrant docs](http://docs.vagrantup.com/v2/cli/) for more information.

### Virtual hosts
Virtual hosts are defined in the apache manifest located at /manifests/apache.pp. You can copy and paste the example 
to create the vhosts that you need. Just change 'example.dev' and the docroot to whatever you like.

To connect to vhosts in your browser, you'll need to add an entry to your hosts file. 




