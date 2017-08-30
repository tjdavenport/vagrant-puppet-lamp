class { 'apt':
  update => {
    frequency => 'always',
  },
}

apt::source { 'multiverse':
  comment => "needed to download mod_fastcgi",
  location => "http://archive.ubuntu.com/ubuntu",
  release => "trusty",
  repos => "multiverse"
}

