#!/usr/bin/pup
# installs flask (2.1.0) from pip3

class flask (
  $ensure = present,
) {
  package { 'python3-pip':
    ensure => installed,
  }

  exec { 'install_flask':
    command => '/usr/bin/pip3 install flask',
    unless  => '/usr/bin/pip3 show flask',
    path    => '/usr/bin',
    require => Package['python3-pip'],
  }
}
