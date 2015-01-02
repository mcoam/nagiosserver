class nagios::client_nrpe inherits nagios::params {

case $::osfamily {
'redhat': {
    package {$nagios_client_package:
        ensure      => "installed",
    }

    service { "$nrpe_service":
        ensure      => running,
        enable      => true,
    }

   file { "$nrpe_config_file":
        ensure  => present,
        content => template("${module_name}/nrpe.cfg_rhel.erb"),
        notify  => Service[ "$nrpe_service" ],
    }

  } # cierra redhat case 

   'debian': {
    package {$nagios_client_package_debian:
        ensure => "installed",
    }

    service { "$nrpe_service_debian":
        ensure      => running,
        enable      => true,
    }

   file { "$nrpe_config_file_debian":
        ensure  => present,
        content => template("${module_name}/nrpe.cfg_deb.erb"),
        notify  => Service[ "$nrpe_service_debian" ],
    }

  file { "$nrpe_default_debian":
        ensure  => present,
        content => template("${module_name}/nrpe-server_default_debian"),
        notify  => Service[ "$nrpe_service_debian" ],
    }
 } # cierra debian case

   default: {
     # ...
	notify {"Your Operating Systems isn't supported":}
   } # cierra default case

 } # cierra case osfamily

} #cierra clase
