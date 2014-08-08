class nagios::server_import {

    Nagios_host <<||>> {
        require => Class[ 'nagios::server_package' ],
        notify  => Class[ 'nagios::server_service' ]
    }

    Nagios_service <<||>> {
        require => Class[ 'nagios::server_package' ],
        notify  => Class[ 'nagios::server_service' ]
    }

   Nagios_hostgroup <<||>> {
    require => Class['nagios::server_package'],
    notify  => Class['nagios::server_service'],
  }
}
