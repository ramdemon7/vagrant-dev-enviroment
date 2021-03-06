
class apache_webserver
{
  include apt

  apt::ppa { 'ppa:ondrej/php5':
    before => Class['apache'],
  }

  class { 'apache':
    require => Exec['apt-get update'],
    mpm_module => 'prefork',
    default_vhost => false,
  }

  class { 'apache::mod::php':
  }

  class { 'apache::mod::rewrite':
  }

  apache::vhost { 'botdemon.college.local':
    port => 80,
    docroot => '/var/www/public',
    serveradmin => 'admin@botdemon.com',
    serveraliases => ['web.college.local', 'college.local'],
    override => ['All'],
  }

  file { [ '/var/www', '/var/www/public' ]:
    ensure => directory,
  }

  host { 'botdemon.college.local':
    ensure => present,
    ip => '192.168.33.10',
    comment => 'The local web server',
    host_aliases => ['web.college.local', 'college.local'],
  }

  host { 'db.college.server':
    ensure => present,
    ip => '192.168.33.11',
    comment => 'The remote database server',
  }
}