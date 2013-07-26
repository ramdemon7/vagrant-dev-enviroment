# Enable XDebug ("0" | "1")
$use_xdebug = "0"

# Default path
Exec
{
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

include bootstrap

node 'www.botdemon.stage' {
  exec
  {
      'apt-get update':
          command => '/usr/bin/apt-get update',
  }

  include other
  include phpmyadmin
  include apache_webserver
  include redis
  include nodejs_init
  # include memcached

  include laravel_app

}

node 'db.botdemon' {

  exec
  {
      'apt-get update':
      command => '/usr/bin/apt-get update',
  }

  class { 'db_server':
  }
}
