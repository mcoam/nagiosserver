class nagios::server_hostgroup {


@@nagios_hostgroup { 'TVN':
    ensure         => present,
    alias          => 'TVN Servers',
    hostgroup_name => 'TVN',
    target         => "/etc/nagios/objects/localhost.cfg",
  }

}
