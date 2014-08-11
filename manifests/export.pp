class nagios::export inherits nagios::params {

case $fqdn {
      'node1.example.com': {
		include export_generic

    @@nagios_service { "check_smtp${hostname}":
        host_name   =>   $::fqdn,
        use   => "generic-service",
        service_description     => "Check SMTP",
        check_command   => "check_smtp",
        target  => "$servers_config_path/${::fqdn}.cfg",
      }
	
 }  ###CIERRA PRIMER NODO###
      'node2.example.com': { 
	include export_generic

} 
      default:             {  

    } ###CIERRA DEFAULT
  } ###CIERRA CASE
} ###CIERRA CLASE



