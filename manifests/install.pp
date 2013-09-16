# == Class: iptables_persistent::install
#
# Simple class to install, update or remove necesary packages.
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
# Pedro González Serrano - http://niteman.es
#
# === Copyright
#
# Copyright 2013 Pedro González Serrano.
# Licensed under "The MIT License". See LINCENSE file
#
class iptables_persistent::install {

  require iptables_persistent::params

  package { $iptables_persistent::package_name:
    ensure  => $iptables_persistent::package_ensure,
  }

}
