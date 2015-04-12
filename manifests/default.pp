import 'apt.pp'
import 'apache.pp'
import 'php.pp'
import 'mysql.pp'
import 'nodejs.pp'
import 'git.pp'

class { 'vim': }
class { 'ohmyzsh': }
ohmyzsh::install { 'vagrant': }


