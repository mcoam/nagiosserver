class nagios::server_service {
 
    exec { 'fix-permissions':
	path 	    => "/usr/local/bin/:/bin/:/usr/bin",
        command     => "find /etc/nagios/ -type f -name '*cfg' | xargs chmod +r",
        refreshonly => true,
    } ->
 
    service { 'nagios':
        ensure  => running,
        enable  => true,
    }
    
    service { 'httpd':
        ensure  => running,
        enable  => true,
    }
}
