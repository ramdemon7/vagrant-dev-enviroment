class ruby_init {
    exec { "install-ruby":
        command => "apt-get install -y ruby1.9.1 rubygems1.9.1",
        require => Exec['apt-get update'],
        timeout => 0,
    }
}