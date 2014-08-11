class nagios::export_generic inherits nagios::params {

@@nagios_host { $fqdn:
        use					=> "linux-server",
         ensure				=> present,
         alias				=> $hostname,
         address			=> $ipaddress_eth1,
         target				=> "/etc/nagios/servers/${::fqdn}.cfg",
	hostgroups => 'TVN',
      }

      @@nagios_service { "check_ping_${hostname}":
	host_name      =>   $::fqdn,
	use	=> "generic-service",
	service_description => "Check Ping",
	check_command	=> "check_ping!100.0,20%!500.0,60%",
	target	=> "$servers_config_path/${::fqdn}.cfg",
      }

        @@nagios_service { "check_disk${hostname}":
        host_name    =>   $::fqdn,
        use             => "generic-service",
        service_description => "Check Root Disk",
        check_command   => "check_nrpe!check_root_partition",
        target  => "$servers_config_path/${::fqdn}.cfg",
      }

      @@nagios_service { "check_ssh${hostname}":
        host_name              =>   $::fqdn,
         use                    => "generic-service",
         service_description    => "Check SSH",
         check_command          => "check_ssh",
         target                 => "$servers_config_path/${::fqdn}.cfg",
      }

        @@nagios_service { "current_users${hostname}":
        host_name              =>   $::fqdn,
         use                    => "generic-service",
         service_description    => "Current Users",
         check_command          => "check_nrpe!check_users",
         target                 => "$servers_config_path/${::fqdn}.cfg",
      }

        @@nagios_service { "current_swap${hostname}":
        host_name              =>   $::fqdn,
         use                    => "generic-service",
         service_description    => "Current Swap",
         check_command          => "check_nrpe!check_swap",
         target                 => "$servers_config_path/${::fqdn}.cfg",
      }

    @@nagios_service { "check_load${hostname}":
        host_name   =>   $::fqdn,
        use   => "generic-service",
        service_description     => "Check Load",
        check_command   => "check_nrpe!check_load",
        target  => "$servers_config_path/${::fqdn}.cfg",
 
      }  

    @@nagios_service { "check_memory${hostname}":
        host_name   =>   $::fqdn,
        use   => "generic-service",
        service_description     => "Check Memory Ram",
        check_command   => "check_nrpe!check_memory",
        target  => "$servers_config_path/${::fqdn}.cfg",
 
      }  



}#cierra clase
