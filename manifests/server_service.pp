class nagios::server_service inherits nagios {
 
    exec { 'fix-permissions':
	path 	    => "/usr/local/bin/:/bin/:/usr/bin",
        command     => "find /etc/nagios/ -type f -name '*cfg' | xargs chmod +r",
        refreshonly => true,
    } ->
 
    service { "$nagios_service":
        ensure  => running,
        enable  => true,
#	notify => Exec["reloadnagios"]
    } 

#  exec{"reloadnagios":
#	path 	    => "/usr/local/bin/:/bin/:/usr/bin",
#	onlyif => "/etc/init.d/nagios stop",
#	command => "puppet agent --test",
#}
    
    service { "$httpd_service":
        ensure  => running,
        enable  => true,
    }
}
