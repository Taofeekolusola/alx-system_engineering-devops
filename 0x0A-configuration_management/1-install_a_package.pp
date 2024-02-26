#!/usr/bin/pup
# Install an especific version of flask (2.1.0)
class flask (
  String $version = '2.1.0',
) {

  package { 'python3-pip':
    ensure => present,
  }

  package { 'virtualenv':
    ensure => present,
  }

  exec { 'create_virtualenv':
    command => "python3 -m virtualenv /path/to/your/virtualenv",
    creates => "/path/to/your/virtualenv",
    require => [
      Package['python3-pip'],
      Package['virtualenv'],
    ],
  }

  exec { 'install_flask':
    command => "/path/to/your/virtualenv/bin/pip3 install flask==${version}",
    require => Exec['create_virtualenv'],
  }

}
