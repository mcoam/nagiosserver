class nagios::export inherits nagios::params {

#$servers_config_path='/etc/nagios/servers'

@@nagios_host { $fqdn:
         use					=> "linux-server",
         ensure				=> present,
         alias				=> $hostname,
         address			=> $ipaddress_eth1,
         target				=> "/etc/nagios/servers/${::fqdn}.cfg",
      }

      @@nagios_service { "check_ping_${hostname}":
					host_name             =>   $::fqdn,
					use										=> "generic-service",
					service_description  	=> "Check Ping",
					check_command					=> "check_ping!100.0,20%!500.0,60%",
					target								=> "$servers_config_path/${::fqdn}.cfg",
      }
	
	@@nagios_service { "check_disk${hostname}":
					host_name             =>   $::fqdn,
					use										=> "generic-service",
					service_description  	=> "Check Root Disk",
					check_command					=> "check_local_disk!20%!10%!/",
					target								=> "$servers_config_path/${::fqdn}.cfg",
      }

     @@nagios_service { "check_load${hostname}":
					host_name             =>   $::fqdn,
					use										=> "generic-service",
					service_description  	=> "Check Load Average",
					check_command					=> "check_local_load!5.0,4.0,3.0!10.0,6.0,4.0",
					target								=> "$servers_config_path/${::fqdn}.cfg",
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
         check_command          => "check_local_users!20!50",
         target                 => "$servers_config_path/${::fqdn}.cfg",
      }

	@@nagios_service { "check_swap${hostname}":
        host_name              =>   $::fqdn,
         use                    => "generic-service",
         service_description    => "Swap Use",
         check_command          => "check_local_swap!20!10",
         target                 => "$servers_config_path/${::fqdn}.cfg",
      }
}
