class nagios::server_config inherits nagios   {

file {"hostgroups.cfg":
				ensure  => present,
			  path    => "$servers_config_path/objects/",
}


file { $servers_config_path:
	ensure => directory,
    }


file { $servers_config_file:
	require => File["/etc/nagios/servers"],
 	ensure  => present,
	#content => template("nagios/nagios.cfg.erb"),
	source => "puppet:///modules/nagios/nagios.cfg",
	notify  => Class[ 'nagios::server_service' ],
    }


#notify { 'Config Hello World': }

}
