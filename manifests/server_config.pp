class nagios::server_config inherits nagios   {


file { "/etc/nagios/servers":
	ensure => directory,
    }


file { '/etc/nagios/nagios.cfg':
	require => File["/etc/nagios/servers"],
    	ensure  => present,
	content => template("/etc/puppet/modules/nagios/templates/nagios.cfg.erb"),
#	source => "puppet:///modules/nagios/nagios.cfg",
	notify  => Class[ 'nagios::server_service' ],
    }


file { '/etc/nagios/objects/contacts.cfg':
        ensure  => present,
        #content => template("/etc/puppet/modules/nagios/templates/contacts.cfg.erb"),
	source => "puppet:///modules/nagios/contacts.cfg",
        notify  => Class[ 'nagios::server_service' ],
    }


#notify { 'Config Hello World': }

}
