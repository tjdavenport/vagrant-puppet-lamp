class { '::mysql::server':
  root_password => 'fragment',
  require => Class['apt']
}

mysql::db { 'example':
  user     => 'example',
  password => 'fragment',
  host     => 'localhost'
}
