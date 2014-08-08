class nagios::server_config inherits nagios   {


file { $servers_config_path:
	ensure => directory,
    }


file { $servers_config_file:
	require => File["/etc/nagios/servers"],
    	ensure  => present,
	content => template("nagios/nagios.cfg.erb"),
	notify  => Class[ 'nagios::server_service' ],
    }


#notify { 'Config Hello World': }

}
