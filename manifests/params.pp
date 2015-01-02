class nagios::params {
	$servers_config_path 	= '/etc/nagios/servers'
	$servers_config_file	= '/etc/nagios/nagios.cfg'
	$allowed_hosts 	     	= '127.0.0.1,10.10.0.101' 
	$nagios_service	     	= 'nagios'
	$nrpe_service		= 'nrpe'
	$nrpe_config_file	= '/etc/nagios/nrpe.cfg'
	$nrpe_sript_file	= '/etc/init.d/nrpe'
	$httpd_service		= 'httpd'
	$nagios_client_package  =  [ 'nrpe', 'nagios-plugins-all' ] 
	$nagios_server_package  =  [ 'nagios','nagios-plugins-all', 'nagios-plugins-nrpe', 'nrpe', 'php', 'httpd' ]
	$hostgroups_file 	= '/etc/nagios/objects/hostgroups.cfg'
	$contacts_file 		= '/etc/nagios/objects/contacts.cfg'
	$nagios_commands_file	= '/etc/nagios/objects/commands.cfg'
	$nagios_plugins_path 	= '/usr/lib64/nagios/plugins'
	$nagios_objects_path	= '/etc/nagios/objects'
	$nagios_client_package_debian	= [ 'nagios-nrpe-server', 'nagios-plugins', 'libnagios-plugin-perl' ]
	$nrpe_config_file_debian        = '/etc/nagios/nrpe_deb.cfg'
	$nrpe_service_debian		= 'nagios-nrpe-server'
	$nrpe_default_debian		= '/etc/default/nagios-nrpe-server'
}
