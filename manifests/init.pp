class nagios (
    $servers_config_path = $nagios::params::servers_config_path,
    $allowed_hosts       = $nagios::params::allowed_hosts,
    $nagios_service      = $nagios::params::nagios_service,
    $nrpe_service  	 = $nagios::params::nrpe_service,          
    $apache_service	 = $nagios::params::apache_service,
)inherits nagios::params {
    include nagios::server_package
    include nagios::server_config
    include nagios::server_service
}
