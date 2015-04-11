class { 'nodejs':
  version => 'latest',
  make_install => false,
}

package { ['grunt-cli', 'bower']:
  provider => 'npm',
  require => Class['nodejs']
}
