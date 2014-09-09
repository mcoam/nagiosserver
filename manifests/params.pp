class nagios::params {
	$servers_config_path 	= '/etc/nagios/servers'
	$servers_config_file	= '/etc/nagios/nagios.cfg'
	$allowed_hosts 	     	= '127.0.0.1, 10.10.0.101' 
	$nagios_service	     	= 'nagios'
	$nrpe_service		= 'nrpe'
	$nrpe_config_file	= '/etc/nagios/nrpe.cfg'
	$httpd_service		= 'httpd'
	$nagios_client_package  =  [ 'nrpe', 'nagios-plugins-all' ] 
	$nagios_server_package  =  [ 'nagios','nagios-plugins-all', 'nagios-plugins-nrpe', 'nrpe', 'php', 'httpd' ]
	$hostgroups_file 	= '/etc/nagios/objects/hostgroups.cfg'
	$contacts_file 	= '/etc/nagios/objects/contacts.cfg'
	$nagios_plugins_path 	= '/usr/lib64/nagios/plugins'
}
