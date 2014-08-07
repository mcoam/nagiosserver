class nagios::params {
	$servers_config_path 	= '/etc/nagios/servers'
	$servers_config_file	= '/etc/nagios/nagios.cfg'
	$allowed_hosts 	     	= '127.0.0.1, 192.168.1.100'
	$nagios_service	     	= 'nagios'
	$nrpe_service		= 'nrpe'
	$nrpe_config_file	= '/etc/nagios/nrpe.cfg'
	$apache_service		= 'httpd'
	$nagios_client_package  =  [ 'nrpe', 'nagios-plugins-all' ] 
	$nagios_server_package  =  [ 'nagios', 'nagios-plugins-nrpe', 'nrpe', 'php', 'httpd' ]
	$nagios_contacs1	= ['name => miguel', 'email => mcoa@itlinux.cl']
}
