class nagios::server_hostgroup {


@@nagios_hostgroup { 'TVN':
    ensure         => present,
    alias          => 'TVN Servers',
    hostgroup_name => 'TVN',
    target         => "/etc/nagios/objects/hostgroups.cfg",
  }

@@nagios_hostgroup { 'vagrant-vm':
    ensure         => present,
    alias          => 'vagrant-vm',
    hostgroup_name => 'vagrant-vm',
    target         => "/etc/nagios/objects/hostgroups.cfg",
  }

}
