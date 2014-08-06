class nagios::server_package {
    package { [ 'nagios', 'nagios-plugins-all', 'nagios-plugins-nrpe', 'nrpe', 'php', 'httpd' ]:
        ensure  => present,
    }
}
