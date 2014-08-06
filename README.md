Module for Nagios Server monitoring version 1.0
==============================================

Install package and setting configuration in Nagios Server
----------------------------------------------------------

	node 'nagios.example.com' {
                include nagios::server_package
                include nagios::server_config
                include nagios::server_service
                include nagios::server_import
        }



Ref. http://blog.bluemalkin.net/tag/puppetdb/
Ref. http://www.allgoodbits.org/articles/view/41
Ref. https://www.digitalocean.com/community/tutorials/how-to-install-nagios-on-centos-6
