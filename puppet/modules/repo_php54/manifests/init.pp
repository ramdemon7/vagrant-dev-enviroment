class repo_php54
{

	#PHP 5.4 setup

    package
    {
    	"python-software-properties":
    		ensure => present,
    		require => Exec['apt-get update']
    }

    #https://launchpad.net/~ondrej/+archive/php5
   	exec
	{
	    'php54-apt-repo':
	        command => '/usr/bin/add-apt-repository ppa:ondrej/php5 -y',
	        require => Package['python-software-properties'],
	}

	exec { "php54 apt update":
		command => 'apt-get update',
        require => Exec['php54-apt-repo'],
	}
}
