
class apache_webserver
{
  include repo_php54

  class { 'apache':
    require => [Exec['apt-get update'], Class['repo_php54']],
    mpm_module => 'prefork',
    default_vhost => false,
  }
  # class { 'apache::mod::prefork':
  # }

  class { 'apache::mod::php':
  }

  apache::vhost { 'botdemon.college.local':
    port => 80,
    docroot => '/var/www/public',
    serveradmin => 'admin@botdemon.com',
  }

  file { [ '/var/www', '/var/www/public' ]:
    ensure => directory,
  }
}