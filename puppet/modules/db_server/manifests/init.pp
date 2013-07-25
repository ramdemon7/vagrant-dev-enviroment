class db_server
{
    class { 'mysql':
      require => Exec['apt-get update'],
    }
    ->
    class { 'mysql::server':
        config_hash => { 'root_password' => 'db_bot125' },
    }
    ->
    database_user { "root@%":
      password_hash => mysql_password('db_bot125'),
      provider => 'mysql',
    }
    ->
    database_grant { "root@%":
      privileges => [ 'all' ],
      provider => 'mysql',
    }
    ->
    mysql::db { 'college_db':
        user => 'college_admin',
        password => 'admin1',
        host => '%',
        grant => ['all'],
    }

    exec { 'sudo sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf':
      require => File['/etc/mysql/my.cnf'],
      notify => Exec['mysqld-restart'],
    }

    class { 'postgresql::server':
      config_hash => {
        'ip_mask_deny_postgres_user' => '0.0.0.0/32',
        'ip_mask_allow_all_users'    => '0.0.0.0/0',
        'listen_addresses'           => '*',
        'manage_redhat_firewall'     => true,
        'postgres_password'          => 'vagrant',
        },
        require => Exec['apt-get update']
    }
    ->
    postgresql::db { 'database':
      user     => 'root',
      password => 'db_bot125',
    }
}