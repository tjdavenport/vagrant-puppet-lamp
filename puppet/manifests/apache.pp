class { "apache":
    mpm_module => 'prefork',
    default_mods => 'true'
}

include apache::mod::rewrite
include apache::mod::fastcgi
include apache::mod::actions

apache::fastcgi::server { 'php':
    host       => '127.0.0.1:9000',
    timeout    => 15,
    flush      => false,
    faux_path  => '/var/www/php.fcgi',
    fcgi_alias => '/php.fcgi',
    file_type  => 'application/x-httpd-php'
}

apache::vhost { 'express.dev':
    port    => '80',
    docroot => '/var/www/ExpressLabs',
    custom_fragment => 'AddType application/x-httpd-php .php',
    override => 'All'
}
