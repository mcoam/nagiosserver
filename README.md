Module for Nagios Server monitoring version 1.0
==============================================

##### Nagios server running only Centos server and nodes supported are Rhel and Debian family

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

For setting contacs configure the values inside *file/contacts.cfg*


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

For setting hostgroups configure this value inside *files/hostgroups.cfg*

	define hostgroup {
		alias                          Vagrant Servers
		hostgroup_name                 Vagrant Servers
	}

after inside the *export.pp/export_generic.pp* in the section *'@@nagios_host' the value *'hostgroups'*

	     @@nagios_host { $fqdn:
        	use             => "linux-server",
         	ensure         => present,
         	alias          => $hostname,
         	address        => $ipaddress_eth1,
         	target         => "/etc/nagios/servers/${::fqdn}.cfg",
         	hostgroups     => 'GTD Servers',
        	 contact_groups  => 'vagrant-vm',
          }
## Monitoring service
The service monitoring are configure in the next class:
- **export.pp**: Custom monitoring for specific nodes (case statement compare *FQDN* facter value)
- **export_generic.pp**: Generic monitoring for all nodes conected to Nagios server

## NRPE command running from Nagios Server
```
[root@srvnagios servers]# /usr/lib64/nagios/plugins/check_nrpe -n -H  node1.example.local -c check_memory
CHECK_MEMORY OK - 7083M free | free=7427448832b;165094440.96:;82547220.48:
[root@srvnagios servers]# /usr/lib64/nagios/plugins/check_nrpe -n -H  node2.example.local -c check_root_partition
DISK OK - free space: / 85945 MB (94% inode=98%);| /=5309MB;76907;86520;0;96134
``` 


####The credentials for webaccess are: nagiosadmin/nagiosadmin


TODO
====

- Ref. http://www.allgoodbits.org/articles/view/41
- Ref. http://blog.bluemalkin.net/tag/puppetdb/
- Ref. https://www.digitalocean.com/community/tutorials/how-to-install-nagios-on-centos-6
