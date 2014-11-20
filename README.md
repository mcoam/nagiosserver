Module for Nagios Server monitoring version 1.0
==============================================

####Install package and setting configuration on Nagios Server

	node 'nagios.example.com' {
                include nagios::server_package
                include nagios::server_config
                include nagios::server_service
                include nagios::server_import
        }


####Install package and setting configuration on Nagios node agent
	
	node 'node1.example.com' {
 		include nagios::client_nrpe
 		include nagios::export
	}



## Setting contacts

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

For setting hostgroups configure this value inside "files/hostgroups.cfg"

	define hostgroup {
		alias                          Vagrant Servers
		hostgroup_name                 Vagrant Servers
	}

after inside the export.pp/export_generic.pp in the section '@@nagios_host' the value 'hostgroups'

	     @@nagios_host { $fqdn:
        	use             => "linux-server",
         	ensure         => present,
         	alias          => $hostname,
         	address        => $ipaddress_eth1,
         	target         => "/etc/nagios/servers/${::fqdn}.cfg",
         	hostgroups     => 'GTD Servers',
        	 contact_groups  => 'vagrant-vm',
          }


The credentials for UI are: user -> nagiosadmin password -> nagiosadmin


TODO
====
- Debian node

- Ref. http://www.allgoodbits.org/articles/view/41
- Ref. http://blog.bluemalkin.net/tag/puppetdb/
- Ref. https://www.digitalocean.com/community/tutorials/how-to-install-nagios-on-centos-6
