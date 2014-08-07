class nagios::params {
	$servers_config_path 	= '/etc/nagios/servers'
	$allowed_hosts 	     	= '127.0.0.1, 192.168.1.100'
	$nagios_service	     	= 'nagios'
	$nrpe_service		= 'nrpe'
	$apache_service		= 'httpd'
	
}
