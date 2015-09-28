class { '::mysql::server':
  root_password => 'fragment',
  require => Class['apt']
}

mysql::db { 'CULTURESCENE':
  user     => 'CULTURESCENE',
  password => 'fragment',
  host     => 'localhost'
}
