class nodejs_init {

    class { 'nodejs':
        use_ubuntu_ppa => true,
    }
    ->
    package { 'bower':
        ensure => present,
        provider => 'npm',
        # require => Exec['install-nodejs'],
        require => Package['nodejs'],
    }
    ->
    package { 'grunt-cli':
        ensure => present,
        provider => 'npm',
        # require => Exec['install-nodejs'],
        require => Package['nodejs'],
    }
}