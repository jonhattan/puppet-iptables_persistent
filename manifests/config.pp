# == Class: iptables_persistent::config
#
# Simple class to install or remove necesary configuration files.
#
# === Parameters
#
# This class doesn't support any parameter.
#
# === Variables
#
# This class doesn't require aditional variables.
#
# === Examples
#
# Not to be directly called.
#
# === Authors
#
# Pedro Gonzalez Serrano - http://niteman.es
#
# === Copyright
#
# Copyright 2013 Pedro Gonzalez Serrano.
# Licensed under "The MIT License". See LINCENSE file
#
class iptables_persistent::config {

  require iptables_persistent::params

  $content_real = $iptables_persistent::content ? {
    undef   => undef,
    default => $iptables_persistent::content,
  }

  file { $iptables_persistent::save_file_real :
    ensure  => $iptables_persistent::ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $content_real,
    source  => $iptables_persistent::source,
    require => Package[$iptables_persistent::package_name],
    notify  => Service[$iptables_persistent::service_name],
  }

}
