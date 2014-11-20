class nagios (
    $servers_config_path    = $nagios::params::servers_config_path,
    $allowed_hosts          = $nagios::params::allowed_hosts,
    $nagios_service         = $nagios::params::nagios_service,
    $nrpe_service	    = $nagios::params::nrpe_service,          
    $nrpe_config_file	    = $nagios::params::nrpe_config_file,
    $apache_service	    = $nagios::params::apache_service,
    $nagios_client_package  = $nagios::params::nagios_client_package,
    $nagios_server_package  = $nagios::params::nagios_server_package,
    $hostgroup_file	    =	$nagios::params::hostgroup_file,
    $nagios_plugins_path     = $nagios::params::nagios_plugins_path,
    $contacts_file     = $nagios::params::contacts_file,
    $nagios_commands_file     = $nagios::params::nagios_commands_file,
    $nagios_objects_path     = $nagios::params::nagios_objects_path,
    $nrpe_sript_file     = $nagios::params::nrpe_sript_file,
)inherits nagios::params {
    include nagios::server_package
    include nagios::server_config
    include nagios::server_service
    include nagios::server_import
}
