class phpmyadmin
{
    require php_deps

    $dbserver = '192.168.33.11'
    $dbport = ''

    package
    {
        "phpmyadmin":
            ensure  => present,
            require => [
                Exec['apt-get update']
            ]
    }

    file
    {
        "/etc/apache2/conf.d/phpmyadmin.conf":
            ensure => link,
            target => "/etc/phpmyadmin/apache.conf",
            require => Package['apache2'],
            notify => Service["apache2"]
    }

    file
    {
        "/etc/phpmyadmin/config.inc.php":
            ensure  => present,
            owner => root, group => root,
            notify  => Service['apache2'],
            content => template('phpmyadmin/config.inc.php.erb'),
            # source  => "/vagrant/puppet/modules/phpmyadmin/templates/config.inc.php",
            require => [Package['phpmyadmin'], Package['apache2']],
    }

    file { "/etc/phpmyadmin/config-db.php":
        ensure => present,
        owner => root, group => 'www-data',
        notify => Service['apache2'],
        content => template('phpmyadmin/config-db.php.erb'),
        # soure => "/vagrant/puppet/modules/phpmyadmin/templates/config-db.php",
        require => [Package['phpmyadmin'], Package['apache2']],
    }
}
