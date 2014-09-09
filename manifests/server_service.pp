class nagios::server_service inherits nagios {
 
    exec { 'fix-permissions':
	path 	    => "/usr/local/bin/:/bin/:/usr/bin",
        command     => "find /etc/nagios/ -type f -name '*cfg' | xargs chmod +r",
        refreshonly => true,
    } ->
 
    service { "$nagios_service":
        ensure  => running,
        enable  => true,
    } 

    service { "$httpd_service":
        ensure  => running,
        enable  => true,
    }
}
