class nagios::client_nrpe inherits nagios::params {

    package {$nagios_client_package:
        ensure      => "installed",
    }

    service { "$nrpe_service":
        ensure      => running,
        enable      => true,
    }

   file { "$nrpe_config_file":
        ensure  => present,
        content => template("nagios/nrpe.cfg.erb"),
        notify  => Service[ "$nrpe_service" ],
    }

   file { "$nrpe_sript_file":
        ensure  => present,
        source => "puppet:///modules/nagios/nrpe",
        notify  => Service[ "$nrpe_service" ],
    }
}
