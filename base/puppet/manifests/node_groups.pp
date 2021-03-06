node_group { 'PE Master':
  classes              => {
    'pe_repo'                                          => {},
    'pe_repo::platform::el_7_x86_64'                   => {},
    'puppet_enterprise::profile::master'               => {},
    'puppet_enterprise::profile::master::mcollective'  => {},
    'puppet_enterprise::profile::mcollective::peadmin' => {},
    'pe_r10k'                                          => { 'remote' => 'file:///var/lib/peadmin/site' }
  },
  environment          => 'production',
  parent               => 'PE Infrastructure',
  rule                 => [ "or", [ "=", "name", $::hostname] ],
  require              => Exec['update classifier'],
}
