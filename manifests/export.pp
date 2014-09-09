class nagios::export inherits nagios::params {

case $fqdn {
      'node1.example.com': {
	 include export_generic

	
 }  ###CIERRA PRIMER NODO###
      'node2.example.com': { 
	include export_generic

    @@nagios_service { "check_ftp${hostname}":
        host_name   =>   $::fqdn,
        use   => "generic-service",
        service_description     => "Check FTP",
        check_command   => "check_ftp",
        target  => "$servers_config_path/${::fqdn}.cfg",
	contact_groups  => 'vagrant-vm', 
      }

} 
      default:             {  

    } ###CIERRA DEFAULT
  } ###CIERRA CASE
} ###CIERRA CLASE



