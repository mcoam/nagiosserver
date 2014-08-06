#Module for Nagios Server monitoring version 1.0

# Usage for nagios server

* Declare the classes within server node 

node 'nagios.example.com' {
  include nagios::server_package
  include nagios::server_config
  include nagios::server_service
  include nagios::server_import
 }

* Run puppet agent for install package server

[root@nagios]# puppet agent --test


# Usage for nagios node

node 'node1.example.com' {
 include nagios::client_nrpe
 include nagios::export
}

* Run puppet agent for install packages client 

[root@nagios]# puppet agent --test


Ref. http://blog.bluemalkin.net/tag/puppetdb/
Ref. http://www.allgoodbits.org/articles/view/41
Ref. https://www.digitalocean.com/community/tutorials/how-to-install-nagios-on-centos-6
