class nagios::server_package inherits nagios {
    package { $nagios_server_package:
        ensure  => present,
    }
}
