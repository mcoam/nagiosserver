class nagios::server_config inherits nagios   {


file { $servers_config_path:
	ensure => directory,
    }


file { $servers_config_file:
	require => File["$servers_config_path"],
 	ensure  => present,
	#content => template("nagios/nagios.cfg.erb"),
	source => "puppet:///modules/nagios/nagios.cfg",
	notify  => Class[ 'nagios::server_service' ],
    }

file { $nagios_objects_path:
	ensure => directory,
    } ->

file { $nagios_commands_file:
	require => File["$nagios_objects_path"],
 	ensure  => present,
	source => "puppet:///modules/nagios/commands.cfg",
	notify  => Class[ 'nagios::server_service' ],
    }

file { $contacts_file:
	require => File["$nagios_objects_path"],
 	ensure  => present,
	source => "puppet:///modules/nagios/contacts.cfg",
	notify  => Class[ 'nagios::server_service' ],
    }


#notify { 'Config Hello World': }

}
