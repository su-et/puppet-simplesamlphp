# Public: Installs SimpleSAMLphp and other tools

class simplesamlphp {

  vcsrepo { "/var/www/simplesamlphp":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/simplesamlphp/simplesamlphp.git',
    revision => 'v1.13.2',
  }

  file { 'idp.crt':
    ensure => 'file',
    path   => '/etc/ssl/certs/idp-itlab.crt',
    source => 'puppet:///modules/simplesamlphp/idp.crt',
    owner  => '0',
    group  => '0',
    mode   => '0644',
  }

  exec { 'c_rehash':
    command => '/usr/bin/c_rehash',
    require => File['idp.crt'],
  }

  file { 'ssp-idp':
    ensure  => 'file',
    path    => '/etc/simplesamlphp/metadata/saml20-idp-remote.php',
    source  => 'puppet:///modules/simplesamlphp/saml2-idp-remote.php',
    owner   => '0',
    group   => '0',
    mode    => '0644',
    require => Package['simplesamlphp'],
  }
  
  file { 'ssp-authsources':
    ensure  => 'file',
    path    => '/etc/simplesamlphp/authsources.php',
    source  => 'puppet:///modules/simplesamlphp/authsources.php',
    owner   => '0',
    group   => '0',
    mode    => '0644',
    require => Package['simplesamlphp'],
  }

  file { 'ssp-config':
    ensure  => 'file',
    path    => '/etc/simplesamlphp/config.php',
    source  => 'puppet:///modules/simplesamlphp/config.php',
    owner   => '0',
    group   => '0',
    mode    => '0644',
    require => Package['simplesamlphp'],
  }
  
  exec { 'enable simplesamlphp config':
    command => '/usr/sbin/a2enconf simplesamlphp',
    require => Package['simplesamlphp'],
  }
}
