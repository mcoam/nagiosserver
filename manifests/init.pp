class nagios (
    $servers_config_path = $nagios::params::servers_config_path,
    $allowed_hosts       = $nagios::params::allowed_hosts,
)inherits nagios::params {
    include nagios::server_package
    include nagios::server_config
    include nagios::server_service
}
