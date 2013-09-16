# == Class: iptables_persistent
#
# A simple class to manage persistent iptables rulesets.
#
# === Parameters
#
# Following parameters are available in addition to thoose inherited from
# iptables_persistent::params.
#
# [*ensure*]
#   String. Should be 'present' or 'absent'. Represents if the class and
#   the corresponding packages, configs, etc. are to be present or absent.
# [*autoupgrade*]
#   Boolean. Represents if the packages should be automatically updated to
#   'latest' version.
#
# === Variables
#
# This calss doesn't require aditional variables.
#
# TODO: Document local variables.
#
# === Examples
#
#  class { iptables_persistent:
#    ensure => 'present',
#  }
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
class iptables_persistent (
  $ensure      = present,
  $autoupgrade = true,
) inherits iptables_persistent::params {

  case $ensure {
    /(present)/: {
      $dir_ensure = 'directory'
      $service_ensure = 'running'
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
      $dir_ensure = 'absent'
      $service_ensure = 'stopped'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  include iptables_persistent::install
  include iptables_persistent::config
  include iptables_persistent::service

}
