# == Class: iptables_persistent::service
#
# Simple class to load configuration from file via service notification.
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
class iptables_persistent::service {

  require iptables_persistent::params

  service { $iptables_persistent::service_name:
    ensure     => $iptables_persistent::service_ensure,
    hasstatus  => false,
    hasrestart => false,
    enable     => true,
  }

}
