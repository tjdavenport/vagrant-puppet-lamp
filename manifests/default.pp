class { '::php':
  ensure       => latest,
  manage_repos => true,
  fpm          => true,
  dev          => true,
  composer     => true,
  pear         => true,
  phpunit      => false,
}

class { '::mysql::server':
  root_password          => 'strongpassword',
  remove_default_accounts => true
}
