class nagios::client_nrpe inherits nagios::params  {

    package { [ 'nagios-plugins-all', 'nrpe' ]:
        ensure      => present,
    }

    service { 'nrpe':
        ensure      => running,
        enable      => true,
    }

file { '/etc/nagios/nrpe.cfg':
        ensure  => present,
        content => template("/etc/puppet/modules/nagios/templates/nrpe.cfg.erb"),
#        source => "puppet:///modules/nagios/nrpe.cfg",
        notify  => Service[ 'nrpe' ],
    }

}
