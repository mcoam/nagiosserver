Module for Nagios Server monitoring version 1.0
==============================================

####Install package and setting configuration in Nagios Server

	node 'nagios.example.com' {
                include nagios::server_package
                include nagios::server_config
                include nagios::server_service
                include nagios::server_import
        }


####Install package and setting configuration in Nagios node agent
	
	node 'node1.example.com' {
 		include nagios::client_nrpe
 		include nagios::export
	}



## Setting contacs

For setting contacs configure the values inside file/contacts.cfg


	define contact{
        	contact_name      mcoa
	        use               generic-contact
        	alias             mcoa
 	       email              mcoa@example.com
        }

	define contactgroup{
        	contactgroup_name   vagrant-vm
        	alias               vagrant-vm
        	members             mcoa, mcoa2
    	}

## Setting hostgroups

For setting hostgroups configure the values inside manifests/server_hostgroup.pp


	class nagios::server_hostgroup {

		@@nagios_hostgroup { 'vagrant-vm':
	    		ensure         => present,
    			alias          => 'vagrant-vm',
    			hostgroup_name => 'vagrant-vm',
    			target         => "/etc/nagios/objects/hostgroups.cfg",
  		}

	}	

and inside the export.pp/export_generic.pp you need setting the tag "contact_groups =>" , example:


	    @@nagios_service { "check_ftp${hostname}":
		host_name   =>   $::fqdn,
		use   => "generic-service",
		service_description     => "Check FTP",
		check_command   => "check_ftp",
		target  => "$servers_config_path/${::fqdn}.cfg",
		contact_groups  => 'vagrant-vm',




TODO
====
- Debian node

- Ref. http://www.allgoodbits.org/articles/view/41
- Ref. http://blog.bluemalkin.net/tag/puppetdb/
- Ref. https://www.digitalocean.com/community/tutorials/how-to-install-nagios-on-centos-6
