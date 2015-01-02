class nagios::export inherits nagios::params {

case $fqdn {
      'node1.example.com': {
	 include export_generic
 }  
###CIERRA PRIMER NODO###
###ABRE SUGUNDO NODO###
      'samba.example.com': { 
	include export_generic

    @@nagios_service { "check_ftp${hostname}":
        host_name   =>   $::fqdn,
        use   => "generic-service",
        service_description     => "Check FTP",
        check_command   => "check_ftp",
        target  => "$servers_config_path/${::fqdn}.cfg",
	contact_groups  => 'itlinux', 
      }

}
####CIERRA SEGUNDO NODO###
###ABRE DEFAULT
      default:             {  
	include export_generic
    } 
###CIERRA DEFAULT
  } ###CIERRA CASE
} ###CIERRA CLASE



